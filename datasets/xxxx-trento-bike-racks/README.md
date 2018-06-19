## Conversion / interlinking / fusion of bikerack data

### Steps
* Input: pickle files under [raw](raw)
* Phase 1 JSON conversion using [pickle2json4.py](refined/pickle2json4.py)
  * Currently requires manual addition of a missing comma to make it valid json
* Phase 2 JSON conversion using [zip-coordinates.js](refined/zip-coordinates.js) of the output of the prior step. Output is an array of json objects, such as
```
[
  {
    "id": 0,
    "wkt": "POINT (11.120105733165468 46.06978628330533)"
  },

  ...
]
```
* RDF Conversion using SPARQL queries [bikeracks-crowd.sparql](bikeracks-crowd.sparql) and [bikeracks-comune-trento.sparql](bikeracks-comune-trento.sparql).
This adds source information to be used in the fusion process.
* Interlinking using LIMES [bikeracks-comune-crowd.limes.xml](bikeracks-comune-crowd.limes.xml). Should actually also become a SPARQL integrate script; but created conventional limes config because it can read from files (although relative file paths not supported, which makes the config file non-portable...)
Output is a set of sameAs links [links-bikeracks-comune-crowd.accept.nt](links-bikeracks-comune-crowd.accept.nt)

* **Next step:** Visualize the links and adjust limes distance parameter until data looks good.

* Produce three way interlinking and obtain the final set of unique bike rack IDs: Use comune entities as the base (because its the official data), complete data with OSM entities that do not have same as links to comune entities, then add crowd sourced entities with neither same as links to comune nor osm entities.





