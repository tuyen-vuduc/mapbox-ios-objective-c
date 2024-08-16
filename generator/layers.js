import fs from 'fs';
import { 
    lowerFirst,
    generateSource } from './helpers/helpers.js';

export var layersHavingSource = [
    'FillExtrusionLayer',
    'HeatmapLayer',
    'HillshadeLayer',
    'LineLayer',
    'CircleLayer',
    'SymbolLayer',
    'FillLayer',
    'RasterLayer',
];

generateLayers() ;

async function generateLayers() {
    var info = JSON.parse(fs.readFileSync('layers.json', 'utf8'));    
    if (!fs.existsSync(info.output)) {        
        fs.mkdirSync(info.output)
    }

    
    await fs.readdirSync(info.input)
        .filter(x => !info.ignored.some(y => x.endsWith(y + '.swift')))
        .map(x => /(\w+)\.swift/.exec(x)[1])
        .forEach(x => generateSource(
            info.input, info.output, x,
            (structName) => {
                let layerType = lowerFirst(structName).replace(/Layer$/, '')
                if (layersHavingSource.indexOf(structName) > -1) {
                    return `@objc open class TMB${structName}: NSObject, TMBLayer {
    @objc public init(id: String, source: String) {
        self.id = id
        self.source = source
        self.type = TMBLayerType.${layerType}
        self.visibility = .visibility(.visible)
    }`;
                }

                return `@objc open class TMB${structName}: NSObject, TMBLayer {
    @objc public init(id: String) {
        self.id = id
        self.type = TMBLayerType.${layerType}
        self.visibility = .visibility(.visible)
    }`;
            },
            (layerName) => {
                if (layersHavingSource.indexOf(layerName) > -1) {
                    return `${layerName}(id: self.id, source: self.source!)`
                }
                return `${layerName}(id: self.id)`
            },
            (layerName) => {
                if (layersHavingSource.indexOf(layerName) > -1) {
                    return `TMB${layerName}(id: self.id, source: self.source!)`
                }
                return `TMB${layerName}(id: self.id)`
            }));    
}