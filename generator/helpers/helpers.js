import fs from 'fs';
import * as path from 'path';

export var sourceTypeMapping = {
    'geoJSON': 'geoJson',
};

export var commonTypeToConversionNameMapping = {
    'bool': 'boolean',
    '[Double]': 'arrayOfDouble',
    '[String]': 'arrayOfString',
};

export function getEnums() {
    var info = JSON.parse(fs.readFileSync('enums.json', 'utf8'));   
    var enumNames = [];
    for(let i=0; i<info.enums.length; i++) {
        let items = getEnumNames(info, info.enums[i]);
        Array.prototype.push.call(enumNames, ...items);
    }    
    return enumNames;
}

function getEnumNames(repoInfo, enumInfo) {
    var input = path.join(repoInfo.mapboxRepo, enumInfo.input, enumInfo.name);
    var content = fs.readFileSync(input, 'utf8');
    return content.split('\n')
        .filter(x => /^public enum/.test(x.trim()) || /^enum/.test(x.trim()))
        .map(x => /enum (\w+)/.exec(x.trim())[1])
}