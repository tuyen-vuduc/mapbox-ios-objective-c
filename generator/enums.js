import fs from 'fs';
import * as path from 'path';

generateEnums();

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
    var initFound = false;
    var skipped = false;
    var processingStatement = false;
    var scopedName = '';
    var lines = content.split('\n')
        .map(line => {
            let xinput = input;
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

                return `@objc open class TMB${objcName}: NSObject {
    public let origin: ${swiftName}
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: ${swiftName}(rawValue: rawValue))
    }

    public init(origin: ${swiftName}) {
       self.origin = origin
    }`
            }

            if (/^public struct/.test(line.trim()) || /^struct/.test(line.trim())) {
                skipped = false;
                caseFound = false
                let matches = /struct (\w+)/.exec(line.trim())
                let enumUnderCheck = matches[1];
                swiftName = scopedName + enumUnderCheck;
                if (scopedName == 'Exp.') {
                    scopedName = 'Expression';
                }
                objcName = scopedName.replace('.', '') + enumUnderCheck;

                return `@objc open class TMB${objcName}: NSObject {
    public let origin: ${swiftName}
    @objc public var rawValue: String {
        origin.rawValue
    }

    @objc public convenience init(rawValue: String) {
        self.init(origin: ${swiftName}(rawValue: rawValue))
    }

    public init(origin: ${swiftName}) {
       self.origin = origin
    }`
            }

            if (skipped) {
                return '__NA__';
            }

            if (/^case/.test(line.trim())) {
                caseFound = true;

                let matches = /case (\w+)/.exec(line.trim())
                cases.push(matches[1])

                return `    @objc public static let ${matches[1]} = TMB${objcName}(origin: ${swiftName}.${matches[1]})`;
            }

            if (/^public static let/.test(line.trim())) {
                caseFound = true;

                let matches = /public static let (\w+)/.exec(line.trim())
                cases.push(matches[1])

                return `    @objc public static let ${matches[1]} = TMB${objcName}(origin: ${swiftName}.${matches[1]})`;
            }

            if (/@_spi/.test(line)) {
                return '        //' + line.trim();
            }

            if (caseFound) {
                skipped = true;
                caseFound = false;
                let nameCamelCase = objcName[0].toLowerCase() + objcName.substring(1);
                let xlines = `}
extension ${swiftName}: ObjcConvertible {
    public func wrap() -> TMB${objcName} {
        TMB${objcName}(origin: self)
    }
    func ${nameCamelCase}() -> TMB${objcName} { wrap() }
}
extension TMB${objcName}: SwiftValueConvertible {
    public func unwrap() -> ${swiftName} {
        self.origin
    }
    func ${nameCamelCase}() -> ${swiftName} { unwrap() }
}
@objc extension TMBValue {
    @objc public class func ${nameCamelCase}(_ ${nameCamelCase}: TMB${objcName}) -> TMBValue {
        return TMBValue(constant: ${nameCamelCase}.rawValue)
    }
}
extension MapboxMaps.Value where T == ${swiftName} {
    func ${nameCamelCase}() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.rawValue)
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension MapboxMaps.Value where T == [${swiftName}] {
    func arrayOf${objcName}() -> TMBValue {
        switch(self) {
        case .constant(let obj):
            return TMBValue(constant: obj.map { $0.rawValue })
        case .expression(let expression):
            return TMBValue(expression: TMBExpression(expression))
        }
    }
}

extension TMBValue {
    func ${nameCamelCase}() -> Value<${swiftName}>? {
        if let constant = self.constant as? String {
            return Value.constant(${swiftName}(rawValue: constant))
        }
        
        return Value.expression(expression!.rawValue)
    }
    
    func arrayOf${scopedName.replace('.', '')}${objcName}() -> Value<[${swiftName}]>? {
        if let constant = self.constant as? [String] {
            return Value.constant(constant.map{ ${swiftName}(rawValue: $0) })
        }
        
        return Value.expression(expression!.rawValue)
    }
}`;

                objcName = null;
                cases = [];
                scopedName = '';

                return xlines
            }

            if (/public let rawValue:/.test(line)) {
                return '__NA__'
            }
            if (/public init/.test(line)) {
                initFound = true;
                return
            }

            if (initFound) {
                if (/}/.test(line)) {
                    initFound = false;
                }
                return '__NA__';
            }

            return line;
        }).filter(x => x != '__NA__');

    fs.writeFileSync(
        path.join(output, `TMB${enumInfo.name}`),
        lines.join('\n'));
}