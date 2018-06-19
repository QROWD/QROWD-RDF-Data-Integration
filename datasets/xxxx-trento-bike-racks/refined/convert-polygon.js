var fs = require('fs');

var json = JSON.parse(fs.readFileSync('trento_ZTL.json', 'utf8'));

var path = json.path;
var wkt = "POLYGON((" + path.map(e => e.lng + ' '  + e.lat).join(', ') + "))";

console.log(wkt);
