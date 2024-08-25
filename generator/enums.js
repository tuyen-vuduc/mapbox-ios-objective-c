import fs from 'fs';
import * as path from 'path';

generateEnums() ;

function generateEnums() {
    var info = JSON.parse(fs.readFileSync('enums.json', 'utf8'));   
    
    info.enums.map(x => generateEnum(info, x));
}

async function generateEnum(repoInfo, enumInfo) {
    var output = path.join(repoInfo.mapboxObjcRepo, enumInfo.output);
    if (!fs.existsSync(output)) {        
        fs.mkdirSync(output);
    }

    var input = path.join(repoInfo.mapboxRepo, enumInfo.input, enumInfo.name);
    var content = fs.readFileSync(input, 'utf8');
    var objcName;
    var swiftName = '';
    var cases = [];
    var caseFound = false;
    var skipped = false;
    var processingStatement = false;    
    var scopedName = '';
    var lines = content.split('\n')
        .map(line => {
            if (processingStatement) {
                processingStatement = false;
                return 'import MapboxMaps\n';
            }

            if (/public extension (\w+)/.test(line.trim())) {
                scopedName = /public extension (\w+)/.exec(line.trim())[1] + '.';
                return '__NA__';
            }

            if (/^\/\//.test(line.trim())
                || !(line.trim())
                || line.trim().startsWith('@available')) {
                return line;
            }

            if (/^import/.test(line)) {
                processingStatement = true;
                return line;
            }

            if (/^public enum/.test(line.trim()) || /^enum/.test(line.trim())) {
                skipped = false;
                caseFound = false
                let matches = /enum (\w+)/.exec(line.trim())
                let enumUnderCheck = matches[1];
                swiftName = scopedName + enumUnderCheck;
                objcName = scopedName.replace('.', '') + enumUnderCheck;

                return `@objc public enum TMB${objcName}: Int {`
            }

            if (skipped) {
                return '__NA__';
            }

            if (/^case/.test(line.trim())) {
                caseFound = true;       

                let matches = /case (\w+)/.exec(line.trim())
                cases.push(matches[1])

                return `    case ${matches[1]}`;
            }

            if (caseFound) {    
                skipped = true;
                caseFound = false;          
                let xcases = cases.map(x => `            case .${x}:
                return .${x}`).join('\n'); 
                let nameCamelCase = objcName[0].toLowerCase() + objcName.substring(1);
                let xlines = `}

@objc extension TMBValue {
    @objc public class func ${nameCamelCase}(_ ${nameCamelCase}: TMB${objcName}) -> TMBValue {
        return TMBValue(constant: NSNumber(value: ${nameCamelCase}.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(with${objcName} ${nameCamelCase}: TMB${objcName}) -> NSNumber {
        return NSNumber(value: ${nameCamelCase}.rawValue)
    }
    
    @objc public func ${nameCamelCase}() -> TMB${objcName} {
        return TMB${objcName}(rawValue: self.intValue)!
    }
}

extension NSNumber {
    public var ${objcName}: ${swiftName} {
        return ${nameCamelCase}().swiftValue()
    }
}

extension TMB${objcName}: SwiftValueConvertible {
    public func swiftValue() -> ${swiftName} {
        switch(self) {
${xcases}
        }
    }

    func asNumber() -> NSNumber {
        return NSNumber(value: self.rawValue)
    }
}

extension ${swiftName}: ObjcConvertible {
    public func objcValue() -> TMB${objcName} {
        switch(self) {
${xcases}
        }
    }

    func asNumber() -> NSNumber {
        return NSNumber(value: objcValue().rawValue)
    }
}

extension MapboxMaps.Value where T == ${swiftName} {
    func ${nameCamelCase}() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.asNumber())
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension MapboxMaps.Value where T == [${swiftName}] {
    func arrayOf${objcName}() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.asNumber() })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension TMBValue {
    func ${nameCamelCase}() -> Value<${swiftName}>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.${objcName})
        }
        
        return Value.expression(expression!.rawValue)
    }
    
    func arrayOf${scopedName.replace('.', '')}${objcName}() -> Value<[${swiftName}]>? {
        if let constant = self.constant as? [NSNumber] {
            return Value.constant(constant.map({ $0.${objcName} }))
        }
        
        return Value.expression(expression!.rawValue)
    }
}`;

                objcName = null;
                cases = [];
                scopedName = '';

                return xlines
            }

            return line;
        }).filter(x => x != '__NA__');
    
    fs.writeFileSync(
        path.join(output, `TMB${enumInfo.name}`), 
        lines.join('\n'));
}