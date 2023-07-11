import fs from 'fs';

var commonTypeToConversionNameMapping = {
    'bool': 'boolean',
};
generateLayers() ;

async function generateLayers() {
    var info = JSON.parse(fs.readFileSync('layers.json', 'utf8'));    
    if (!fs.existsSync(info.output)) {        
        fs.mkdirSync(info.output)
    }

    
    await fs.readdirSync(info.input)
        .filter(x => !info.ignored.some(y => x.endsWith(y + '.swift')))
        .map(x => /(\w+)\.swift/.exec(x)[1])
        .forEach(x => generateLayer(info.input, info.output, x));    
}

async function generateLayer(dir, output, layerName) {
    var content = fs.readFileSync(`${dir}/${layerName}.swift`, 'utf8');
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
                return `@objc open class TMB${layerName}: NSObject, TMBLayer {
    @objc public convenience init(id: String = UUID().uuidString) {
        self.init(id, type: TMBLayerType.${layerName.substring(0,1).toLowerCase() + layerName.replace(/Layer$/, '').substring(1)})
        
        self.visibility = TMBValue(constant: TMBVisibility.visible)
    }
    
    private init(_ id: String = UUID().uuidString, type: TMBLayerType) {
        self.id = id
        self.type = type
    }`;
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
                matches = /(var|let) (\w+): (\[?\w+\]?)(\??)/.exec(x);
            }

            var readonly = matches[1];
            var propName = matches[2];        
            var propType = matches[3];  
            var nullable = matches[4];

            if (isValueObject) {            
                return `    @objc public ${readonly} ${propName} : TMBValue${nullable}`;
            }

            if (!isValueObject && /^(Bool|Double|Int)$/.test(propType)) {
                return nullable 
                    ? `    @objc public ${readonly} ${propName} : NSNumber?`
                    : `    @objc public ${readonly} ${propName} : ${propType}`;
            }

            if (!isValueObject && /^(String)$/.test(propType)) {
                return `    @objc public ${readonly} ${propName} : String${nullable}`;
            }

            return `    @objc public ${readonly} ${propName} : TMB${propType}${nullable}`;
        }).filter(x => x != '__NONE__');
    
        var mapToSwiftPropertyLines = [`
extension TMB${layerName} {
    public func mapTo(_ layer: inout ${layerName}) {`].concat(propertyLines.map(x => {
            var isValueObject = true;
            var matches = /(var|let) (\w+): Value<(\[?\w+\]?)>(\??)/.exec(x);
            
            if (!matches) {
                isValueObject = false;
                matches = /(var|let) (\w+): (\[?\w+\]?)(\??)/.exec(x);
            }

            var readonly = matches[1];
            var propName = matches[2];        
            var propType = matches[3];  
            var nullable = matches[4];

            if (readonly == 'let') {
                return;
            }

            if (!isValueObject && propType == 'String' || !nullable){
                return `        layer.${propName} = self.${propName}`;
            }

            if (!isValueObject && /^(Bool|Double|Int)$/.test(propType)) {
                return `        layer.${propName} = self.${propName}${nullable}.${propType.substring(0,1).toLowerCase() + propType.substring(1)}()`;
            }

            var conversionName = propType.substring(0,1).toLowerCase() + propType.substring(1);
            if (commonTypeToConversionNameMapping[conversionName]) {
                conversionName = commonTypeToConversionNameMapping[conversionName];
            } else if (/^\[/.test(propType)) {
                conversionName = 'arrayOf' + propType.replace(/\[|\]/img, '');
            }

            return `        layer.${propName} = self.${propName}${nullable}.${conversionName}()`;
        })).concat(['    }\n}']);
    
        var mapToObjcPropertyLines = [`
extension ${layerName} {
    public func mapTo(_ layer:inout TMB${layerName}) {`].concat(propertyLines.map(x => {
            var isValueObject = true;
            var matches = /(var|let) (\w+): Value<(\[?\w+\]?)>(\??)/.exec(x);
            
            if (!matches) {
                isValueObject = false;
                matches = /(var|let) (\w+): (\[?\w+\]?)(\??)/.exec(x);
            }

            var readonly = matches[1];
            var propName = matches[2];        
            var propType = matches[3];  
            var nullable = matches[4];

            if (readonly == 'let') {
                return;
            }

            if (!isValueObject && propType == 'String' || !nullable){
                return `        layer.${propName} = self.${propName}`;
            }

            if (!isValueObject && /^(Bool|Double|Int)$/.test(propType)) {
                return `        layer.${propName} = self.${propName}${nullable}.asNumber()`;
            }

            if (propType == 'StyleTransition') {
                return  `        layer.${propName} = self.${propName}${nullable}.objcValue()`;
            }

            if (isValueObject) {
                return `        layer.${propName} = TMBValue.fromSwiftValue(self.${propName})`;
            }

            return  `        layer.${propName} = self.${propName}${nullable}.objcValue()`;
        })).concat(['    }\n}']);

    fs.writeFileSync(
        `${output}/TMB${layerName}.swift`, 
        lines
        .concat(mapToSwiftPropertyLines)
        .concat(mapToObjcPropertyLines)
        .concat([`
extension TMB${layerName}: SwiftValueConvertible {
    public func swiftValue() -> ${layerName} {
        var layer = ${layerName}(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}

extension ${layerName}: ObjcConvertible {
    public func objcValue() ->  TMB${layerName} {
        var layer = TMB${layerName}(id: id)
        
        self.mapTo(&layer)
        
        return layer
    }
}`])
        .join('\n'));
}