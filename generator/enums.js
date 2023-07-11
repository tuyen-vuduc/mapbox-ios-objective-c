import fs from 'fs';

generateEnums() ;

async function generateEnums() {
    var info = JSON.parse(fs.readFileSync('enums.json', 'utf8'));    
    if (!fs.existsSync(info.output)) {        
        fs.mkdirSync(info.output)
    }

    var content = fs.readFileSync(info.input, 'utf8');
    var enumUnderCheck;
    var cases = [];
    var processingStatement = false;    
    var lines = content.split('\n')
        .map(x => {
            if (/^import/.test(x)) {
                processingStatement = true;
                return x;
            }

            if (processingStatement) {
                processingStatement = false;
                return 'import MapboxMaps\n';
            }

            if (/^public enum/.test(x.trim())) {
                let matches = /public enum (\w+)/.exec(x.trim())
                enumUnderCheck = matches[1];

                return `@objc public enum TMB${enumUnderCheck}: Int {`
            }

            if (/^case/.test(x.trim())) {
                let matches = /case (\w+) = ("[^"]+")/.exec(x.trim())
                cases.push(matches[1])

                return `    case ${matches[1]}`;
            }

            if (x.trim() == '}') {
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

extension TMB${enumUnderCheck}: SwiftValueConvertible {
    public func swiftValue() -> ${enumUnderCheck} {
        switch(self) {
${xcases}
        }
    }
}

extension ${enumUnderCheck}: ObjcConvertible {
    public func objcValue() -> TMB${enumUnderCheck} {
        switch(self) {
${xcases}
        }
    }
}`

                enumUnderCheck = null;
                cases = [];

                return xlines
            }

            return x;
        });
    
    fs.writeFileSync(
        `${info.output}/Enums.swift`, 
        lines.join('\n'));
}