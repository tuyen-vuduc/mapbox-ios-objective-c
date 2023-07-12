import fs from 'fs';
import { getEnums, commonTypeToConversionNameMapping, sourceTypeMapping } from './helpers/helpers.js';

var enums = getEnums();

generateSources() ;

async function generateSources() {
    var info = JSON.parse(fs.readFileSync('sources.json', 'utf8'));    
    if (!fs.existsSync(info.output)) {        
        fs.mkdirSync(info.output)
    }

    
    await fs.readdirSync(info.input)
        .filter(x => !info.ignored.some(y => x.endsWith(y + '.swift')))
        .map(x => /(\w+)\.swift/.exec(x)[1])
        .forEach(x => generateSource(info.input, info.output, x));    
}

async function generateSource(dir, output, sourceName) {
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
                var sourceType = sourceName.substring(0,1).toLowerCase() + sourceName.replace(/Source$/, '').substring(1);
                if (sourceTypeMapping[sourceType]) {
                    sourceType = sourceTypeMapping[sourceType];
                }
                return `@objc open class TMB${sourceName}: NSObject, TMBSource {
    @objc public convenience init(id: String) {
        self.init(id, type: TMBSourceType.${sourceType})
    }
    
    private init(_ id: String, type: TMBSourceType) {
        self.id = id
        self.type = type
    }
    
    let id: String`;
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

            if (readonly == 'let') {
                return;
            }

            if (!isValueObject && propType == 'String' || !nullable || array){
                return `        source.${propName} = self.${propName}`;
            }

            if (!isValueObject && /^(Bool|Double|Int)$/.test(propType)) {
                return `        source.${propName} = self.${propName}${nullable}.${propType.substring(0,1).toLowerCase() + propType.substring(1)}()`;
            }

            if (!isValueObject && enums.some(x => x == propType)) {
                return `        source.${propName} = self.${propName}${nullable}.${propType.substring(0,1).toLowerCase() + propType.substring(1)}().swiftValue()`;
            }

            var conversionName = propType.substring(0,1).toLowerCase() + propType.substring(1);
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

            if (!isValueObject && propType == 'String' || !nullable || array || dict){
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
                return `        source.${propName} = TMBValue.fromSwiftValue(self.${propName})`;
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
    public func objcValue(_ id: String) ->  TMB${sourceName} {
        var source = TMB${sourceName}(id: id)
        
        self.mapTo(&source)
        
        return source
    }
}`])
        .join('\n'));
}