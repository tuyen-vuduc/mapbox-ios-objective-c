import fs from 'fs';
import * as path from 'path';

export var commonTypeToConversionNameMapping = {
    // 'bool': 'boolean',
    '[Double]': 'arrayOfDouble',
    '[String]': 'arrayOfString',
};

export function getEnums() {
    var info = JSON.parse(fs.readFileSync('enums.json', 'utf8'));   
    var enumNames = [];
    for(let i=0; i<info.enums.length; i++) {
        let items = getEnumNames(info, info.enums[i]);
        Array.prototype.push.call(enumNames, ...items);
    }    
    return enumNames;
}

function getEnumNames(repoInfo, enumInfo) {
    var input = path.join(repoInfo.mapboxRepo, enumInfo.input, enumInfo.name);
    var content = fs.readFileSync(input, 'utf8');
    return content.split('\n')
        .filter(x => /^public enum/.test(x.trim()) || /^enum/.test(x.trim()))
        .map(x => /enum (\w+)/.exec(x.trim())[1])
}

export function lowerFirst(input) {
    return input[0].toLowerCase() + input.substring(1)
}

let enums = getEnums();
export async function generateSource(dir, output, sourceName, ctorDeclaration, unwrapInit, wrapInit) {
    var content = fs.readFileSync(`${dir}/${sourceName}.swift`, 'utf8');
    var processingStatement = false;
    var initReached = false;
    var propertyLines = []
    var lines = content.split('\n')
        .map(x => {
            if (initReached) {
                return '__NONE__';
            }

            if (/^import/.test(x)) {
                processingStatement = true;
                return x;
            }

            if (processingStatement) {
                processingStatement = false;
                return 'import MapboxMaps\n';
            }

            if (/^public struct/.test(x.trim())) {
                return ctorDeclaration(sourceName);
            }

            if (/^public init/.test(x.trim())) {
                initReached = true;
                return '}';
            }

            if (/@_/.test(x)) {
                return x.replace(/@_/, '// @_')
            }

            let isPropertyLine = /^\s+public (var|let)/.test(x);
            if (!isPropertyLine) {
                return x;
            }

            propertyLines.push(x);
                
            var isValueObject = true;
            var matches = /(var|let) (\w+): Value<(\[?\w+\]?)>(\??)/.exec(x);
            
            if (!matches) {
                isValueObject = false;
                matches = /(var|let) (\w+): ([\[]{0,3}[^\]\?]+[\]]{0,3})(\??)/.exec(x);
            }

            var readonly = matches[1];
            var propName = matches[2];        
            var propType = matches[3];  
            var nullable = matches[4];

            if (isValueObject) {            
                return `    @objc public ${readonly} ${propName}: TMBValue${nullable}`;
            }

            if (!isValueObject && /^(Bool|Double|Int)$/.test(propType)) {
                return nullable 
                    ? `    @objc public ${readonly} ${propName}: NSNumber${nullable}`
                    : `    @objc public ${readonly} ${propName}: ${propType}`;
            }

            if (!isValueObject && enums.some(x => x == propType)) {
                return nullable 
                    ? `    @objc public ${readonly} ${propName}: NSNumber${nullable}`
                    : `    @objc public ${readonly} ${propName}: TMB${propType}`;
            }

            if (!isValueObject && /^(String)$/.test(propType)) {
                return `    @objc public ${readonly} ${propName}: String${nullable}`;
            }

            if (/\[/.test(propType)) {
                return `    @objc public ${readonly} ${propName}: ${propType}${nullable}`
            }

            return `    @objc public ${readonly} ${propName}: TMB${propType}${nullable}`;
        }).filter(x => x != '__NONE__');
    
        var mapToSwiftPropertyLines = [`
extension TMB${sourceName} {
    func mapTo(_ source: inout ${sourceName}) {`].concat(propertyLines.map(x => {
            var isValueObject = true;
            var matches = /(var|let) (\w+): Value<(\[?\w+\]?)>(\??)/.exec(x);
            
            if (!matches) {
                isValueObject = false;
                matches = /(var|let) (\w+): ([\[]{0,3}[^\]\?]+[\]]{0,3})(\??)/.exec(x);
            }

            const readonly = matches[1];
            const propName = matches[2];        
            const propType = matches[3];  
            const nullable = matches[4];
            const array = /\[/.test(propType);
            const dict = /\[\w+\s*\:/.test(propType);

            if (readonly == 'let') {
                return;
            }

            if (dict) {
                // TODO Check types of key and value
                // const dmatches = /\[(\w+):\s*(\w+)\]/.exec(propType);
                // const keyType = dmatches[1];
                // const valueType = dmatches[2];

                return `        source.${propName} = self.${propName}${nullable}.mapValues{ $0.unwrap() }`;
            }

            if (array) {

            }

            var conversionName = lowerFirst(propType);
            if (!isValueObject && (propType == 'String' || !nullable || array || dict)){
                return `        source.${propName} = self.${propName}`;
            }

            if (!isValueObject && /^(Bool|Double|Int)$/.test(propType)) {
                return `        source.${propName} = self.${propName}${nullable}.${conversionName}()`;
            }

            if (!isValueObject && enums.some(x => x == propType)) {
                return `        source.${propName} = self.${propName}${nullable}.${conversionName}()`;
            }

            if (commonTypeToConversionNameMapping[conversionName]) {
                conversionName = commonTypeToConversionNameMapping[conversionName];
            } else if (/^\[/.test(propType)) {
                conversionName = 'arrayOf' + propType.replace(/\[|\]/img, '');
            }

            return `        source.${propName} = self.${propName}${nullable}.${conversionName}()`;
        }).filter(x => !!x)).concat(['    }\n}']);
    
        var mapToObjcPropertyLines = [`
extension ${sourceName} {
    func mapTo(_ source:inout TMB${sourceName}) {`].concat(propertyLines.map(x => {
            var isValueObject = true;
            var matches = /(var|let) (\w+): Value<(\[?\w+\]?)>(\??)/.exec(x);
            
            if (!matches) {
                isValueObject = false;
                matches = /(var|let) (\w+): ([\[]{0,3}[^\]\?]+[\]]{0,3})(\??)/.exec(x);
            }

            var readonly = matches[1];
            var propName = matches[2];        
            var propType = matches[3];  
            var nullable = matches[4];
            var array = /\[/.test(propType);
            var dict = /\[\w+\s*\:/.test(propType);

            if (readonly == 'let') {
                return;
            }

            if (dict) {
                // TODO Check types of key and value
                // const dmatches = /\[(\w+):\s*(\w+)\]/.exec(propType);
                // const keyType = dmatches[1];
                // const valueType = dmatches[2];

                return `        source.${propName} = self.${propName}${nullable}.mapValues{ $0.wrap() }`;
            }

            var conversionName = lowerFirst(propType);
            if (!isValueObject && (propType == 'String' || !nullable || array || dict)){
                return `        source.${propName} = self.${propName}`;
            }

            if (!isValueObject && /^(Bool|Double|Int)$/.test(propType)) {
                return `        source.${propName} = self.${propName}${nullable}.${conversionName}()`;
            }

            if (!isValueObject && enums.some(x => x == propType)) {
                return `        source.${propName} = self.${propName}${nullable}.wrap()`;
            }

            if (propType == 'StyleTransition') {
                return  `        source.${propName} = self.${propName}${nullable}.wrap()`;
            }

            if (isValueObject) {
                if (commonTypeToConversionNameMapping[conversionName]) {
                    conversionName = commonTypeToConversionNameMapping[conversionName];
                } else if (/^\[/.test(propType)) {
                    conversionName = 'arrayOf' + propType.replace(/\[|\]/img, '');
                }
                return `        source.${propName} = self.${propName}${nullable}.${conversionName}()`;
            }

            return  `        source.${propName} = self.${propName}${nullable}.wrap()`;
        }).filter(x => !!x)).concat(['    }\n}']);

    fs.writeFileSync(
        `${output}/TMB${sourceName}.swift`, 
        lines
        .concat(mapToSwiftPropertyLines)
        .concat(mapToObjcPropertyLines)
        .concat([`
extension TMB${sourceName}: SwiftValueConvertible {
    public func unwrap() -> ${sourceName} {
        var result = ${unwrapInit(sourceName)}
        self.mapTo(&result)
        return result
    }
}

extension ${sourceName} {
    func wrap() -> TMB${sourceName} {
        var result = ${wrapInit(sourceName)}
        self.mapTo(&result)
        return result
    }
}`])
        .join('\n'));
}