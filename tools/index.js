import fs from 'fs';

var content = fs.readFileSync('input.txt', 'utf8');
var lines = content.split('\n');
var prefixedTypes = lines.map((item, index) => {
    if (item.trim().startsWith('public var')) {
       var name = /public var (\w+): (\[?\w+\]?\??)/.exec(item)[1];
       var type = /public var (\w+): (\[?\w+\]?\??)/.exec(item)[2];

       return [name, type];
    }
 
     return item;
 });

 var transformed = lines.map((item, index) => {
    if (/^\s+public var/.test(item)) {
        var propType = prefixedTypes[index][1];
        if (/(Bool|Double)\?$/.test(propType)) {
            return item.replace(/(Bool|Double)\?/, 'NSNumber?');
        }

        if (/Bool|String|Double/.test(propType.replace(/[\[\]\?]/img, ''))) return `    @objc
${item}`;
        
        return `    @objc
${item.replace(/: (\[?)(\w+)(\]?\??)/, ': $1TMB$2$3')}`; 
    }
    
    if (/^\s+return/.test(item)) {
        var propName = prefixedTypes[index-2][0];
        var propType = prefixedTypes[index-2][1];
        
        if (/(Bool|Double)\?$/.test(propType)) {
            return `            // ${propType}
            guard let ${propName} = self.swiftValue.${propName} else {
                return nil
            }
            return NSNumber(value: ${propName})`;
        }

        if (/(Bool|String|Double)$/.test(propType.replace(/[\[\]\?]/img, ''))) {
            return '            return self.swiftValue.' + propName;
        }

        if (/^\[/.test(propType)) {
            propType = propType.replace(/[\[\]\?]/img, '');
            return `            return self.swiftValue.${propName}?.map { TMB${propType}(value: $0) }`;
        }
        propType = propType.replace(/[\[\]\?]/img, '');

        return `            guard let ${propName} = self.swiftValue.${propName} else {
                return nil
            }
            return TMB${propType}(value: ${propName})`;
    }

    if (/^\s+layerProperties/.test(item)) {
        var propName = prefixedTypes[index-5][0];
        var propType = prefixedTypes[index-5][1];
        
        if (/(Bool)\?$/.test(propType)) {
            return `            // ${propType}
            self.swiftValue.${propName} = newValue?.boolValue`;
        }

        if (/(Double)\?$/.test(propType)) {
            return `            // ${propType}
            self.swiftValue.${propName} = newValue?.doubleValue`;
        }

        if (/Bool|String|Double/.test(propType.replace(/[\[\]\?]/img, ''))) 
            return '            self.swiftValue.' + propName + ' = newValue';

        if (/^\[/.test(propType)) {
            propType = propType.replace(/[\[\]\?]/img, '');
            return `            self.swiftValue.${propName} = newValue?.map { $0.swiftValue() }`;
        }

        return '            self.swiftValue.' + propName + ' = newValue?.swiftValue()';
    }
    
    return item;
})
 
fs.writeFileSync('output.txt', transformed.join('\n'));