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
    var enumUnderCheck;
    var cases = [];
    var caseFound = false;
    var skipped = false;
    var processingStatement = false;    
    var lines = content.split('\n')
        .map(line => {
            if (processingStatement) {
                processingStatement = false;
                return 'import MapboxMaps\n';
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

            if (/^public enum/.test(line.trim())) {
                skipped = false;
                caseFound = false
                let matches = /public enum (\w+)/.exec(line.trim())
                enumUnderCheck = matches[1];

                return `@objc public enum TMB${enumUnderCheck}: Int {`
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
                let nameCamelCase = enumUnderCheck[0].toLowerCase() + enumUnderCheck.substring(1);
                let xlines = `}

@objc extension TMBValue {
    @objc public class func ${nameCamelCase}(_ ${nameCamelCase}: TMB${enumUnderCheck}) -> TMBValue {
        return TMBValue(constant: NSNumber(value: ${nameCamelCase}.rawValue))
    }
}

@objc extension NSNumber {
    @objc public class func value(with${enumUnderCheck} ${nameCamelCase}: TMB${enumUnderCheck}) -> NSNumber {
        return NSNumber(value: ${nameCamelCase}.rawValue)
    }
    
    @objc public func ${nameCamelCase}() -> TMB${enumUnderCheck} {
        return TMB${enumUnderCheck}(rawValue: self.intValue)!
    }
}

extension NSNumber {
    public var ${enumUnderCheck}: ${enumUnderCheck} {
        return ${nameCamelCase}().swiftValue()
    }
}

extension TMB${enumUnderCheck}: SwiftValueConvertible {
    public func swiftValue() -> ${enumUnderCheck} {
        switch(self) {
${xcases}
        }
    }

    func asNumber() -> NSNumber {
        return NSNumber(value: self.rawValue)
    }
}

extension ${enumUnderCheck}: ObjcConvertible {
    public func objcValue() -> TMB${enumUnderCheck} {
        switch(self) {
${xcases}
        }
    }

    func asNumber() -> NSNumber {
        return NSNumber(value: objcValue().rawValue)
    }
}

extension MapboxMaps.Value where T == ${enumUnderCheck} {
    func ${nameCamelCase}() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.asNumber())
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension MapboxMaps.Value where T == [${enumUnderCheck}] {
    func arrayOf${enumUnderCheck}() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.asNumber() })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension TMBValue {
    func ${nameCamelCase}() -> Value<${enumUnderCheck}>? {
        if let constant = self.constant as? NSNumber {
            return Value.constant(constant.${enumUnderCheck})
        }
        
        return Value.expression(expression!.rawValue)
    }
    
    func arrayOf${enumUnderCheck}() -> Value<[${enumUnderCheck}]>? {
        if let constant = self.constant as? [NSNumber] {
            return Value.constant(constant.map({ $0.${enumUnderCheck} }))
        }
        
        return Value.expression(expression!.rawValue)
    }
}`;

                enumUnderCheck = null;
                cases = [];

                return xlines
            }

            return line;
        }).filter(x => x != '__NA__');
    
    fs.writeFileSync(
        path.join(output, enumInfo.name), 
        lines.join('\n'));
}