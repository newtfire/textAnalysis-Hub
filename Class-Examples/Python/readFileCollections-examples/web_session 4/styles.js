var styles = [ {
  "format_version" : "1.0",
  "generated_by" : "cytoscape-3.10.3",
  "target_cytoscapejs_version" : "~2.1",
  "title" : "default",
  "style" : [ {
    "selector" : "node",
    "css" : {
      "text-valign" : "center",
      "text-halign" : "center",
      "text-opacity" : 1.0,
      "border-color" : "rgb(204,204,204)",
      "font-size" : 30,
      "color" : "rgb(0,0,0)",
      "width" : 35.0,
      "border-width" : 0.0,
      "border-opacity" : 1.0,
      "height" : 35.0,
      "background-color" : "rgb(161,217,155)",
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "background-opacity" : 1.0,
      "shape" : "roundrectangle",
      "content" : "data(name)"
    }
  }, {
    "selector" : "node[nodeType = 'ADJ']",
    "css" : {
      "shape" : "v"
    }
  }, {
    "selector" : "node[synsetCount > 72]",
    "css" : {
      "background-color" : "rgb(103,0,31)"
    }
  }, {
    "selector" : "node[synsetCount = 72]",
    "css" : {
      "background-color" : "rgb(152,0,67)"
    }
  }, {
    "selector" : "node[synsetCount > 0][synsetCount < 72]",
    "css" : {
      "background-color" : "mapData(synsetCount,0,72,rgb(231,225,239),rgb(152,0,67))"
    }
  }, {
    "selector" : "node[synsetCount = 0]",
    "css" : {
      "background-color" : "rgb(231,225,239)"
    }
  }, {
    "selector" : "node[synsetCount < 0]",
    "css" : {
      "background-color" : "rgb(247,244,249)"
    }
  }, {
    "selector" : "node:selected",
    "css" : {
      "background-color" : "rgb(255,255,0)"
    }
  }, {
    "selector" : "edge",
    "css" : {
      "content" : "",
      "source-arrow-shape" : "none",
      "color" : "rgb(0,0,0)",
      "text-opacity" : 1.0,
      "font-size" : 10,
      "line-color" : "rgb(132,132,132)",
      "target-arrow-shape" : "none",
      "target-arrow-color" : "rgb(0,0,0)",
      "width" : 2.0,
      "opacity" : 1.0,
      "line-style" : "solid",
      "font-family" : "Dialog",
      "font-weight" : "normal",
      "source-arrow-color" : "rgb(0,0,0)"
    }
  }, {
    "selector" : "edge:selected",
    "css" : {
      "line-color" : "rgb(255,0,0)"
    }
  } ]
} ]