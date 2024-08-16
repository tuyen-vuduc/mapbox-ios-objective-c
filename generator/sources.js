import fs from 'fs';
import { 
    lowerFirst,
    generateSource } from './helpers/helpers.js';

export var sourceTypeMapping = {
    'geoJSON': 'geoJson',
};
    
generateSources() ;

async function generateSources() {
    var info = JSON.parse(fs.readFileSync('sources.json', 'utf8'));    
    if (!fs.existsSync(info.output)) {        
        fs.mkdirSync(info.output)
    }

    await fs.readdirSync(info.input)
        .filter(x => !info.ignored.some(y => x.endsWith(y + '.swift')))
        .map(x => /(\w+)\.swift/.exec(x)[1])
        .forEach(x => generateSource(
            info.input, info.output, x, 
            (structName) => {
                var sourceType = lowerFirst(structName).replace(/Source$/, '');
                if (sourceTypeMapping[sourceType]) {
                    sourceType = sourceTypeMapping[sourceType];
                }
                return  `@objc open class TMB${structName}: NSObject, TMBSource {
    @objc public init(id: String) {
        self.id = id
        self.type = TMBSourceType.${sourceType}
    }`
            }, 
            (sourceName) => { return `${sourceName}(id: self.id)` },
            (sourceName) => { return `TMB${sourceName}(id: self.id)` }));    
}