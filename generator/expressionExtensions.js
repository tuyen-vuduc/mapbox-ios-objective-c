import fs from 'fs';
import * as path from 'path';

generateExpressionExtensions() ;

function generateExpressionExtensions() {
    var info = JSON.parse(fs.readFileSync('expressionExtensions.json', 'utf8'));   
    
    var output = path.join(info.mapboxObjcRepo, info.output);
    if (!fs.existsSync(output)) {        
        fs.mkdirSync(output);
    }

    var input = path.join(info.mapboxRepo, info.input, info.name);
    var content = fs.readFileSync(input, 'utf8');
    var lines = content.split('\n')
        .filter(x => /^case (\w+)/.test(x.trim()))
        .map(x => {
            var matches = /case (\w+)/.exec(x.trim());
            return `    public class func ${matches[1]}() -> TMBExpression {
        return TMBExpression.create(withOperator: .${matches[1]})
    }
    public class func ${matches[1]}(_ arguments: [Any]) -> TMBExpression {
        return TMBExpression.create(withOperator: .${matches[1]}, arguments: arguments)
    }`;
        });
    
    fs.writeFileSync(
        path.join(output, "TMBExpressionExtensions.swift"), 
        [`// This file is generated.
@objc extension TMBExpression {`].concat(lines).concat('}').join('\n'));
}