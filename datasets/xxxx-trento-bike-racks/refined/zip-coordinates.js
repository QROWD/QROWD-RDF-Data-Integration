#!/usr/bin/node

var fs = require('fs');

var filename = process.argv[2];

//console.log("File: " + filename);

var json = JSON.parse(fs.readFileSync(filename, 'utf8'));

var x = json.lng;
var y = json.lat;

var n = x.length;
if(n != y.length) {
  throw new Error("Lat/Long array lengths do not match up");
}

var c = x.map((e, i) => [e, y[i]]);
var r = c.map((e, i) => ({ id: i, wkt: "POINT (" + e[0] + " " + e[1] + ")" }));


console.log(JSON.stringify(r, null, 2));

