import fs from 'fs';
import * as path from 'path';
import { getEnums, commonTypeToConversionNameMapping, sourceTypeMapping } from './helpers/helpers.js';

var enums = getEnums();

generateFiles() ;

function generateFiles() {
    var info = JSON.parse(fs.readFileSync('others.json', 'utf8'));   
    
    info.files.map(x => generateFile(info, x));
}

async function generateFile(repoInfo, enumInfo) {
    var output = path.join(repoInfo.mapboxObjcRepo, enumInfo.output);
    if (!fs.existsSync(output)) {        
        fs.mkdirSync(output);
    }

    var input = path.join(repoInfo.mapboxRepo, enumInfo.input, enumInfo.name);
    var content = fs.readFileSync(input, 'utf8');
    var processingStatement = false;
    var initReached = false;
    var propertyLines = [];
    var sourceName = '';
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
                let matches = /struct (\w+)/.exec(x.trim())
                sourceName = matches[1]
                return `@objc open class TMB${sourceName}: NSObject {`;
            }

            if (/^public init/.test(x.trim())) {
                initReached = true;
                return '}';
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
                matches = /(var|let) (\w+): ([\[]{0,3}\w+[\]]{0,3})(\??)/.exec(x);
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
    public func mapTo(_ source: inout ${sourceName}) {`].concat(propertyLines.map(x => {
            var isValueObject = true;
            var matches = /(var|let) (\w+): Value<(\[?\w+\]?)>(\??)/.exec(x);
            
            if (!matches) {
                isValueObject = false;
                matches = /(var|let) (\w+): ([\[]{0,3}\w+[\]]{0,3})(\??)/.exec(x);
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

            if (!isValueObject && (propType == 'String' || !nullable || array || dict)){
                return `        source.${propName} = self.${propName}`;
            }

            if (!isValueObject && /^(Bool|Double|Int)$/.test(propType)) {
                return `        source.${propName} = self.${propName}${nullable}.${propType.substring(0,1).toLowerCase() + propType.substring(1)}()`;
            }

            if (!isValueObject && enums.some(x => x == propType)) {
                return `        source.${propName} = self.${propName}${nullable}.${propType.substring(0,1).toLowerCase() + propType.substring(1)}().swiftValue()`;
            }

            if (isValueObject) {
                let conversionName = propType[0].toLowerCase() + propType.substring(1);
                if (commonTypeToConversionNameMapping[conversionName]) {
                    conversionName = commonTypeToConversionNameMapping[conversionName];
                } else if (/^\[/.test(propType)) {
                    conversionName = 'arrayOf' + propType.replace(/\[|\]/img, '');
                }
                return `        source.${propName} = self.${propName}${nullable}.${conversionName}()`;
            }

            var conversionName = propType[0].toLowerCase() + propType.substring(1);
            if (commonTypeToConversionNameMapping[conversionName]) {
                conversionName = commonTypeToConversionNameMapping[conversionName];
            } else if (/^\[/.test(propType)) {
                conversionName = 'arrayOf' + propType.replace(/\[|\]/img, '');
            }

            return `        source.${propName} = self.${propName}${nullable}.${conversionName}()`;
        })).concat(['    }\n}']);
    
        var mapToObjcPropertyLines = [`
extension ${sourceName} {
    public func mapTo(_ source:inout TMB${sourceName}) {`].concat(propertyLines.map(x => {
            var isValueObject = true;
            var matches = /(var|let) (\w+): Value<(\[?\w+\]?)>(\??)/.exec(x);
            
            if (!matches) {
                isValueObject = false;
                matches = /(var|let) (\w+): (\[\w+\s*:\s*\w+\])(\??)/.exec(x);
            }

            if (!matches) {
                isValueObject = false;
                matches = /(var|let) (\w+): ([\[]{0,3}\w+[\]]{0,3})(\??)/.exec(x);
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

            if (!isValueObject && (propType == 'String' || !nullable || array || dict)){
                return `        source.${propName} = self.${propName}`;
            }

            if (!isValueObject && /^(Bool|Double|Int)$/.test(propType)) {
                return `        source.${propName} = self.${propName}${nullable}.asNumber()`;
            }

            if (!isValueObject && enums.some(x => x == propType)) {
                return `        source.${propName} = self.${propName}${nullable}.objcValue().asNumber()`;
            }

            if (propType == 'StyleTransition') {
                return  `        source.${propName} = self.${propName}${nullable}.objcValue()`;
            }

            if (isValueObject) {
                var conversionName = propType[0].toLowerCase() + propType.substring(1);
                if (commonTypeToConversionNameMapping[conversionName]) {
                    conversionName = commonTypeToConversionNameMapping[conversionName];
                } else if (/^\[/.test(propType)) {
                    conversionName = 'arrayOf' + propType.replace(/\[|\]/img, '');
                }
                return `        source.${propName} = self.${propName}${nullable}.${conversionName}()`;
            }

            return  `        source.${propName} = self.${propName}${nullable}.objcValue()`;
        })).concat(['    }\n}']);

    fs.writeFileSync(
        `${output}/TMB${sourceName}.swift`, 
        lines
        .concat(mapToSwiftPropertyLines)
        .concat(mapToObjcPropertyLines)
        .concat([`
extension TMB${sourceName}: SwiftValueConvertible {
    public func swiftValue() -> ${sourceName} {
        var source = ${sourceName}()
        
        self.mapTo(&source)
        
        return source
    }
}

extension ${sourceName} {
    public func objcValue() ->  TMB${sourceName} {
        var source = TMB${sourceName}()
        
        self.mapTo(&source)
        
        return source
    }
}`])
        .join('\n'));
}