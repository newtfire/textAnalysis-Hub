var styles = [ {
  "format_version" : "1.0",
  "generated_by" : "cytoscape-3.10.4",
  "target_cytoscapejs_version" : "~2.1",
  "title" : "default black",
  "style" : [ {
    "selector" : "node",
    "css" : {
      "text-valign" : "bottom",
      "text-halign" : "right",
      "height" : 15.0,
      "background-color" : "rgb(255,255,255)",
      "width" : 15.0,
      "shape" : "ellipse",
      "color" : "rgb(204,204,204)",
      "font-size" : 12,
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "border-opacity" : 1.0,
      "background-opacity" : 1.0,
      "border-color" : "rgb(0,153,0)",
      "border-width" : 0.0,
      "text-opacity" : 1.0,
      "content" : "data(name)"
    }
  }, {
    "selector" : "node:selected",
    "css" : {
      "background-color" : "rgb(255,255,0)"
    }
  }, {
    "selector" : "edge",
    "css" : {
      "line-color" : "rgb(0,153,0)",
      "line-style" : "solid",
      "font-family" : "Dialog",
      "font-weight" : "normal",
      "target-arrow-color" : "rgb(0,0,0)",
      "source-arrow-shape" : "none",
      "content" : "",
      "source-arrow-color" : "rgb(0,0,0)",
      "width" : 2.0,
      "opacity" : 1.0,
      "text-opacity" : 1.0,
      "target-arrow-shape" : "none",
      "color" : "rgb(0,0,0)",
      "font-size" : 10
    }
  }, {
    "selector" : "edge:selected",
    "css" : {
      "line-color" : "rgb(255,0,0)"
    }
  } ]
}, {
  "format_version" : "1.0",
  "generated_by" : "cytoscape-3.10.4",
  "target_cytoscapejs_version" : "~2.1",
  "title" : "Sample1",
  "style" : [ {
    "selector" : "node",
    "css" : {
      "text-valign" : "center",
      "text-halign" : "center",
      "height" : 25.0,
      "background-color" : "rgb(127,205,187)",
      "width" : 25.0,
      "shape" : "ellipse",
      "color" : "rgb(51,51,51)",
      "font-size" : 10,
      "font-family" : "Dialog",
      "font-weight" : "normal",
      "border-opacity" : 1.0,
      "background-opacity" : 1.0,
      "border-color" : "rgb(0,0,0)",
      "border-width" : 0.0,
      "text-opacity" : 1.0,
      "content" : "data(name)"
    }
  }, {
    "selector" : "node:selected",
    "css" : {
      "background-color" : "rgb(255,255,0)"
    }
  }, {
    "selector" : "edge",
    "css" : {
      "line-color" : "rgb(153,153,153)",
      "line-style" : "solid",
      "font-family" : "Dialog",
      "font-weight" : "normal",
      "target-arrow-color" : "rgb(0,0,0)",
      "source-arrow-shape" : "none",
      "source-arrow-color" : "rgb(0,0,0)",
      "width" : 1.0,
      "opacity" : 1.0,
      "text-opacity" : 1.0,
      "target-arrow-shape" : "none",
      "color" : "rgb(51,51,51)",
      "font-size" : 10,
      "content" : "data(interaction)"
    }
  }, {
    "selector" : "edge[interaction = 'pp']",
    "css" : {
      "line-style" : "solid"
    }
  }, {
    "selector" : "edge[interaction = 'pd']",
    "css" : {
      "line-style" : "dashed"
    }
  }, {
    "selector" : "edge:selected",
    "css" : {
      "line-color" : "rgb(255,0,0)"
    }
  } ]
}, {
  "format_version" : "1.0",
  "generated_by" : "cytoscape-3.10.4",
  "target_cytoscapejs_version" : "~2.1",
  "title" : "Nested Network Style",
  "style" : [ {
    "selector" : "node",
    "css" : {
      "text-valign" : "center",
      "text-halign" : "center",
      "height" : 40.0,
      "background-color" : "rgb(255,255,255)",
      "width" : 60.0,
      "shape" : "ellipse",
      "color" : "rgb(0,0,0)",
      "font-size" : 12,
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "border-opacity" : 1.0,
      "background-opacity" : 1.0,
      "border-color" : "rgb(0,0,0)",
      "border-width" : 2.0,
      "text-opacity" : 1.0,
      "content" : "data(shared_name)"
    }
  }, {
    "selector" : "node[has_nested_network]",
    "css" : {
      "text-valign" : "bottom"
    }
  }, {
    "selector" : "node[has_nested_network]",
    "css" : {
      "border-color" : "rgb(0,102,204)"
    }
  }, {
    "selector" : "node[has_nested_network]",
    "css" : {
      "shape" : "rectangle"
    }
  }, {
    "selector" : "node[has_nested_network]",
    "css" : {
      "background-color" : "rgb(255,255,255)"
    }
  }, {
    "selector" : "node[has_nested_network]",
    "css" : {
      "color" : "rgb(0,102,204)"
    }
  }, {
    "selector" : "node:selected",
    "css" : {
      "background-color" : "rgb(255,255,0)"
    }
  }, {
    "selector" : "edge",
    "css" : {
      "line-color" : "rgb(64,64,64)",
      "line-style" : "solid",
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "target-arrow-color" : "rgb(0,0,0)",
      "source-arrow-shape" : "none",
      "content" : "",
      "source-arrow-color" : "rgb(0,0,0)",
      "width" : 1.0,
      "opacity" : 1.0,
      "text-opacity" : 1.0,
      "target-arrow-shape" : "none",
      "color" : "rgb(0,0,0)",
      "font-size" : 10
    }
  }, {
    "selector" : "edge:selected",
    "css" : {
      "line-color" : "rgb(255,0,0)"
    }
  } ]
}, {
  "format_version" : "1.0",
  "generated_by" : "cytoscape-3.10.4",
  "target_cytoscapejs_version" : "~2.1",
  "title" : "Directed",
  "style" : [ {
    "selector" : "node",
    "css" : {
      "text-valign" : "center",
      "text-halign" : "center",
      "height" : 45.0,
      "background-color" : "rgb(255,255,255)",
      "width" : 45.0,
      "shape" : "ellipse",
      "color" : "rgb(51,153,255)",
      "font-size" : 8,
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "border-opacity" : 1.0,
      "background-opacity" : 1.0,
      "border-color" : "rgb(145,145,145)",
      "border-width" : 5.0,
      "text-opacity" : 1.0,
      "content" : "data(name)"
    }
  }, {
    "selector" : "node:selected",
    "css" : {
      "background-color" : "rgb(255,0,102)"
    }
  }, {
    "selector" : "edge",
    "css" : {
      "line-color" : "rgb(204,204,204)",
      "line-style" : "solid",
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "target-arrow-color" : "rgb(204,204,204)",
      "source-arrow-shape" : "none",
      "source-arrow-color" : "rgb(204,204,204)",
      "width" : 5.0,
      "opacity" : 1.0,
      "text-opacity" : 1.0,
      "target-arrow-shape" : "triangle",
      "color" : "rgb(51,153,255)",
      "font-size" : 12,
      "content" : "data(interaction)"
    }
  }, {
    "selector" : "edge:selected",
    "css" : {
      "line-color" : "rgb(255,0,0)"
    }
  } ]
}, {
  "format_version" : "1.0",
  "generated_by" : "cytoscape-3.10.4",
  "target_cytoscapejs_version" : "~2.1",
  "title" : "Solid",
  "style" : [ {
    "selector" : "node",
    "css" : {
      "text-valign" : "center",
      "text-halign" : "center",
      "height" : 40.0,
      "background-color" : "rgb(102,102,102)",
      "width" : 40.0,
      "shape" : "ellipse",
      "color" : "rgb(0,0,0)",
      "font-size" : 14,
      "font-family" : "Dialog",
      "font-weight" : "normal",
      "border-opacity" : 1.0,
      "background-opacity" : 1.0,
      "border-color" : "rgb(0,0,0)",
      "border-width" : 0.0,
      "text-opacity" : 1.0,
      "content" : "data(name)"
    }
  }, {
    "selector" : "node:selected",
    "css" : {
      "background-color" : "rgb(255,255,0)"
    }
  }, {
    "selector" : "edge",
    "css" : {
      "line-color" : "rgb(204,204,204)",
      "line-style" : "solid",
      "font-family" : "Dialog",
      "font-weight" : "normal",
      "target-arrow-color" : "rgb(0,0,0)",
      "source-arrow-shape" : "none",
      "source-arrow-color" : "rgb(0,0,0)",
      "width" : 12.0,
      "opacity" : 1.0,
      "text-opacity" : 1.0,
      "target-arrow-shape" : "none",
      "color" : "rgb(0,0,0)",
      "font-size" : 10,
      "content" : "data(interaction)"
    }
  }, {
    "selector" : "edge:selected",
    "css" : {
      "line-color" : "rgb(255,0,0)"
    }
  } ]
}, {
  "format_version" : "1.0",
  "generated_by" : "cytoscape-3.10.4",
  "target_cytoscapejs_version" : "~2.1",
  "title" : "Gradient1",
  "style" : [ {
    "selector" : "node",
    "css" : {
      "text-valign" : "bottom",
      "text-halign" : "right",
      "height" : 30.0,
      "background-color" : "rgb(0,0,0)",
      "width" : 30.0,
      "shape" : "ellipse",
      "color" : "rgb(204,204,204)",
      "font-size" : 8,
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "border-opacity" : 1.0,
      "background-opacity" : 1.0,
      "border-color" : "rgb(0,0,0)",
      "border-width" : 0.0,
      "text-opacity" : 1.0,
      "content" : "data(name)"
    }
  }, {
    "selector" : "node:selected",
    "css" : {
      "background-color" : "rgb(255,255,0)"
    }
  }, {
    "selector" : "edge",
    "css" : {
      "line-color" : "rgb(102,102,102)",
      "line-style" : "solid",
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "target-arrow-color" : "rgb(0,0,0)",
      "source-arrow-shape" : "none",
      "content" : "",
      "source-arrow-color" : "rgb(0,0,0)",
      "width" : 1.0,
      "opacity" : 1.0,
      "text-opacity" : 1.0,
      "target-arrow-shape" : "none",
      "color" : "rgb(0,0,0)",
      "font-size" : 10
    }
  }, {
    "selector" : "edge:selected",
    "css" : {
      "line-color" : "rgb(255,0,0)"
    }
  } ]
}, {
  "format_version" : "1.0",
  "generated_by" : "cytoscape-3.10.4",
  "target_cytoscapejs_version" : "~2.1",
  "title" : "Universe",
  "style" : [ {
    "selector" : "node",
    "css" : {
      "text-valign" : "center",
      "text-halign" : "center",
      "height" : 40.0,
      "background-color" : "rgb(0,0,0)",
      "width" : 40.0,
      "shape" : "ellipse",
      "color" : "rgb(255,255,255)",
      "font-size" : 18,
      "font-family" : "Monospaced",
      "font-weight" : "normal",
      "border-opacity" : 1.0,
      "background-opacity" : 1.0,
      "border-color" : "rgb(0,0,0)",
      "border-width" : 0.0,
      "text-opacity" : 1.0,
      "content" : "data(name)"
    }
  }, {
    "selector" : "node:selected",
    "css" : {
      "background-color" : "rgb(255,255,0)"
    }
  }, {
    "selector" : "edge",
    "css" : {
      "line-color" : "rgb(153,153,153)",
      "line-style" : "dashed",
      "font-family" : "Dialog",
      "font-weight" : "normal",
      "target-arrow-color" : "rgb(0,0,0)",
      "source-arrow-shape" : "none",
      "content" : "",
      "source-arrow-color" : "rgb(0,0,0)",
      "width" : 2.0,
      "opacity" : 1.0,
      "text-opacity" : 1.0,
      "target-arrow-shape" : "none",
      "color" : "rgb(0,0,0)",
      "font-size" : 10
    }
  }, {
    "selector" : "edge:selected",
    "css" : {
      "line-color" : "rgb(255,0,0)"
    }
  } ]
}, {
  "format_version" : "1.0",
  "generated_by" : "cytoscape-3.10.4",
  "target_cytoscapejs_version" : "~2.1",
  "title" : "Big Labels",
  "style" : [ {
    "selector" : "node",
    "css" : {
      "text-valign" : "center",
      "text-halign" : "center",
      "height" : 5.0,
      "background-color" : "rgb(255,255,255)",
      "width" : 5.0,
      "shape" : "ellipse",
      "color" : "rgb(51,51,51)",
      "font-size" : 24,
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "border-opacity" : 1.0,
      "background-opacity" : 1.0,
      "border-color" : "rgb(0,0,0)",
      "border-width" : 0.0,
      "text-opacity" : 1.0,
      "content" : "data(name)"
    }
  }, {
    "selector" : "node:selected",
    "css" : {
      "background-color" : "rgb(255,0,102)"
    }
  }, {
    "selector" : "edge",
    "css" : {
      "line-color" : "rgb(183,183,183)",
      "line-style" : "solid",
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "target-arrow-color" : "rgb(0,0,0)",
      "source-arrow-shape" : "none",
      "content" : "",
      "source-arrow-color" : "rgb(0,0,0)",
      "width" : 1.0,
      "opacity" : 1.0,
      "text-opacity" : 1.0,
      "target-arrow-shape" : "none",
      "color" : "rgb(0,0,0)",
      "font-size" : 10
    }
  }, {
    "selector" : "edge:selected",
    "css" : {
      "line-color" : "rgb(255,0,0)"
    }
  } ]
}, {
  "format_version" : "1.0",
  "generated_by" : "cytoscape-3.10.4",
  "target_cytoscapejs_version" : "~2.1",
  "title" : "Sample2",
  "style" : [ {
    "selector" : "node",
    "css" : {
      "text-valign" : "center",
      "text-halign" : "right",
      "height" : 50.0,
      "background-color" : "rgb(58,127,182)",
      "width" : 50.0,
      "shape" : "ellipse",
      "color" : "rgb(102,102,102)",
      "font-size" : 20,
      "font-family" : "HelveticaNeue-Light",
      "font-weight" : "normal",
      "border-opacity" : 1.0,
      "background-opacity" : 1.0,
      "border-color" : "rgb(255,255,255)",
      "border-width" : 15.0,
      "text-opacity" : 1.0,
      "content" : "data(name)"
    }
  }, {
    "selector" : "node:selected",
    "css" : {
      "background-color" : "rgb(255,255,0)"
    }
  }, {
    "selector" : "edge",
    "css" : {
      "line-color" : "rgb(255,255,255)",
      "line-style" : "solid",
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "target-arrow-color" : "rgb(0,0,0)",
      "source-arrow-shape" : "none",
      "content" : "",
      "source-arrow-color" : "rgb(0,0,0)",
      "width" : 20.0,
      "opacity" : 1.0,
      "text-opacity" : 1.0,
      "target-arrow-shape" : "none",
      "color" : "rgb(0,0,0)",
      "font-size" : 10
    }
  }, {
    "selector" : "edge:selected",
    "css" : {
      "line-color" : "rgb(255,0,0)"
    }
  } ]
}, {
  "format_version" : "1.0",
  "generated_by" : "cytoscape-3.10.4",
  "target_cytoscapejs_version" : "~2.1",
  "title" : "Curved",
  "style" : [ {
    "selector" : "node",
    "css" : {
      "text-valign" : "bottom",
      "text-halign" : "right",
      "height" : 18.0,
      "background-color" : "rgb(254,196,79)",
      "width" : 18.0,
      "shape" : "ellipse",
      "color" : "rgb(102,102,102)",
      "font-size" : 14,
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "border-opacity" : 1.0,
      "background-opacity" : 1.0,
      "border-color" : "rgb(255,255,255)",
      "border-width" : 7.0,
      "text-opacity" : 1.0,
      "content" : "data(name)"
    }
  }, {
    "selector" : "node:selected",
    "css" : {
      "background-color" : "rgb(255,255,0)"
    }
  }, {
    "selector" : "edge",
    "css" : {
      "line-color" : "rgb(255,255,255)",
      "line-style" : "solid",
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "target-arrow-color" : "rgb(255,255,255)",
      "source-arrow-shape" : "none",
      "content" : "",
      "source-arrow-color" : "rgb(255,255,255)",
      "width" : 3.0,
      "opacity" : 1.0,
      "text-opacity" : 1.0,
      "target-arrow-shape" : "triangle",
      "color" : "rgb(0,0,0)",
      "font-size" : 10
    }
  }, {
    "selector" : "edge:selected",
    "css" : {
      "line-color" : "rgb(255,0,0)"
    }
  } ]
}, {
  "format_version" : "1.0",
  "generated_by" : "cytoscape-3.10.4",
  "target_cytoscapejs_version" : "~2.1",
  "title" : "Ripple",
  "style" : [ {
    "selector" : "node",
    "css" : {
      "text-valign" : "center",
      "text-halign" : "center",
      "height" : 50.0,
      "background-color" : "rgb(255,255,255)",
      "width" : 50.0,
      "shape" : "ellipse",
      "color" : "rgb(19,58,96)",
      "font-size" : 8,
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "border-opacity" : 1.0,
      "background-opacity" : 1.0,
      "border-color" : "rgb(51,153,255)",
      "border-width" : 20.0,
      "text-opacity" : 1.0,
      "content" : "data(name)"
    }
  }, {
    "selector" : "node:selected",
    "css" : {
      "background-color" : "rgb(255,255,204)"
    }
  }, {
    "selector" : "edge",
    "css" : {
      "line-color" : "rgb(51,153,255)",
      "line-style" : "solid",
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "target-arrow-color" : "rgb(0,0,0)",
      "source-arrow-shape" : "none",
      "content" : "",
      "source-arrow-color" : "rgb(0,0,0)",
      "width" : 3.0,
      "opacity" : 1.0,
      "text-opacity" : 1.0,
      "target-arrow-shape" : "none",
      "color" : "rgb(0,0,0)",
      "font-size" : 10
    }
  }, {
    "selector" : "edge:selected",
    "css" : {
      "line-color" : "rgb(255,0,0)"
    }
  } ]
}, {
  "format_version" : "1.0",
  "generated_by" : "cytoscape-3.10.4",
  "target_cytoscapejs_version" : "~2.1",
  "title" : "Sample3",
  "style" : [ {
    "selector" : "node",
    "css" : {
      "text-valign" : "bottom",
      "text-halign" : "right",
      "height" : 20.0,
      "background-color" : "rgb(61,154,255)",
      "width" : 20.0,
      "shape" : "ellipse",
      "color" : "rgb(206,206,206)",
      "font-size" : 14,
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "border-opacity" : 1.0,
      "background-opacity" : 1.0,
      "border-color" : "rgb(255,255,255)",
      "border-width" : 8.0,
      "text-opacity" : 1.0,
      "content" : "data(name)"
    }
  }, {
    "selector" : "node:selected",
    "css" : {
      "background-color" : "rgb(255,255,0)"
    }
  }, {
    "selector" : "edge",
    "css" : {
      "line-color" : "rgb(255,255,255)",
      "line-style" : "solid",
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "target-arrow-color" : "rgb(0,0,0)",
      "source-arrow-shape" : "none",
      "content" : "",
      "source-arrow-color" : "rgb(0,0,0)",
      "width" : 2.0,
      "opacity" : 1.0,
      "text-opacity" : 1.0,
      "target-arrow-shape" : "none",
      "color" : "rgb(0,0,0)",
      "font-size" : 10
    }
  }, {
    "selector" : "edge:selected",
    "css" : {
      "line-color" : "rgb(255,0,0)"
    }
  } ]
}, {
  "format_version" : "1.0",
  "generated_by" : "cytoscape-3.10.4",
  "target_cytoscapejs_version" : "~2.1",
  "title" : "Minimal",
  "style" : [ {
    "selector" : "node",
    "css" : {
      "text-valign" : "center",
      "text-halign" : "center",
      "height" : 42.0,
      "background-color" : "rgb(255,255,255)",
      "width" : 42.0,
      "shape" : "rectangle",
      "color" : "rgb(51,51,51)",
      "font-size" : 9,
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "border-opacity" : 1.0,
      "background-opacity" : 1.0,
      "border-color" : "rgb(0,0,0)",
      "border-width" : 0.0,
      "text-opacity" : 1.0,
      "content" : "data(name)"
    }
  }, {
    "selector" : "node:selected",
    "css" : {
      "background-color" : "rgb(255,255,0)"
    }
  }, {
    "selector" : "edge",
    "css" : {
      "line-color" : "rgb(76,76,76)",
      "line-style" : "solid",
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "target-arrow-color" : "rgb(0,0,0)",
      "source-arrow-shape" : "none",
      "content" : "",
      "source-arrow-color" : "rgb(0,0,0)",
      "width" : 2.0,
      "opacity" : 1.0,
      "text-opacity" : 1.0,
      "target-arrow-shape" : "none",
      "color" : "rgb(0,0,0)",
      "font-size" : 10
    }
  }, {
    "selector" : "edge:selected",
    "css" : {
      "line-color" : "rgb(255,0,0)"
    }
  } ]
}, {
  "format_version" : "1.0",
  "generated_by" : "cytoscape-3.10.4",
  "target_cytoscapejs_version" : "~2.1",
  "title" : "default",
  "style" : [ {
    "selector" : "node",
    "css" : {
      "text-valign" : "center",
      "text-halign" : "center",
      "height" : 35.0,
      "background-color" : "rgb(137,208,245)",
      "width" : 35.0,
      "shape" : "v",
      "color" : "rgb(0,0,0)",
      "font-size" : 20,
      "font-family" : "Verdana-Bold",
      "font-weight" : "normal",
      "border-opacity" : 1.0,
      "background-opacity" : 1.0,
      "border-color" : "rgb(204,204,204)",
      "border-width" : 0.0,
      "text-opacity" : 1.0,
      "content" : "data(name)"
    }
  }, {
    "selector" : "node[Degree > 643]",
    "css" : {
      "font-size" : 1
    }
  }, {
    "selector" : "node[Degree = 643]",
    "css" : {
      "font-size" : 16
    }
  }, {
    "selector" : "node[Degree > 1][Degree < 643]",
    "css" : {
      "font-size" : "mapData(Degree,1,643,9,16)"
    }
  }, {
    "selector" : "node[Degree = 1]",
    "css" : {
      "font-size" : 9
    }
  }, {
    "selector" : "node[Degree < 1]",
    "css" : {
      "font-size" : 1
    }
  }, {
    "selector" : "node[nodeType = 'ADJ']",
    "css" : {
      "shape" : "roundrectangle"
    }
  }, {
    "selector" : "node[synsetCount > 47]",
    "css" : {
      "background-color" : "rgb(1,70,54)"
    }
  }, {
    "selector" : "node[synsetCount = 47]",
    "css" : {
      "background-color" : "rgb(1,108,89)"
    }
  }, {
    "selector" : "node[synsetCount > 23][synsetCount < 47]",
    "css" : {
      "background-color" : "mapData(synsetCount,23,47,rgb(103,169,207),rgb(1,108,89))"
    }
  }, {
    "selector" : "node[synsetCount > 0][synsetCount < 23]",
    "css" : {
      "background-color" : "mapData(synsetCount,0,23,rgb(236,226,240),rgb(103,169,207))"
    }
  }, {
    "selector" : "node[synsetCount = 0]",
    "css" : {
      "background-color" : "rgb(236,226,240)"
    }
  }, {
    "selector" : "node[synsetCount < 0]",
    "css" : {
      "background-color" : "rgb(255,247,251)"
    }
  }, {
    "selector" : "node:selected",
    "css" : {
      "background-color" : "rgb(255,255,0)"
    }
  }, {
    "selector" : "edge",
    "css" : {
      "line-color" : "rgb(0,0,4)",
      "line-style" : "solid",
      "font-family" : "Dialog",
      "font-weight" : "normal",
      "target-arrow-color" : "rgb(0,0,0)",
      "source-arrow-shape" : "none",
      "content" : "",
      "source-arrow-color" : "rgb(0,0,0)",
      "width" : 2.0,
      "opacity" : 1.0,
      "text-opacity" : 1.0,
      "target-arrow-shape" : "none",
      "color" : "rgb(0,0,0)",
      "font-size" : 10
    }
  }, {
    "selector" : "edge[count > 80]",
    "css" : {
      "line-color" : "rgb(0,0,4)"
    }
  }, {
    "selector" : "edge[count = 80]",
    "css" : {
      "line-color" : "rgb(29,17,71)"
    }
  }, {
    "selector" : "edge[count > 25.37233987][count < 80]",
    "css" : {
      "line-color" : "mapData(count,25.37233987,80,rgb(183,55,121),rgb(29,17,71))"
    }
  }, {
    "selector" : "edge[count > 1][count < 25.37233987]",
    "css" : {
      "line-color" : "mapData(count,1,25.37233987,rgb(254,196,136),rgb(183,55,121))"
    }
  }, {
    "selector" : "edge[count = 1]",
    "css" : {
      "line-color" : "rgb(254,196,136)"
    }
  }, {
    "selector" : "edge[count < 1]",
    "css" : {
      "line-color" : "rgb(252,253,191)"
    }
  }, {
    "selector" : "edge[count > 80]",
    "css" : {
      "width" : 1.0
    }
  }, {
    "selector" : "edge[count = 80]",
    "css" : {
      "width" : 37.68084877415707
    }
  }, {
    "selector" : "edge[count > 1][count < 80]",
    "css" : {
      "width" : "mapData(count,1,80,3.3997756843280076,37.68084877415707)"
    }
  }, {
    "selector" : "edge[count = 1]",
    "css" : {
      "width" : 3.3997756843280076
    }
  }, {
    "selector" : "edge[count < 1]",
    "css" : {
      "width" : 1.0
    }
  }, {
    "selector" : "edge:selected",
    "css" : {
      "line-color" : "rgb(255,0,0)"
    }
  } ]
}, {
  "format_version" : "1.0",
  "generated_by" : "cytoscape-3.10.4",
  "target_cytoscapejs_version" : "~2.1",
  "title" : "Marquee",
  "style" : [ {
    "selector" : "node",
    "css" : {
      "text-valign" : "bottom",
      "text-halign" : "center",
      "height" : 20.0,
      "background-color" : "rgb(0,204,255)",
      "width" : 20.0,
      "shape" : "ellipse",
      "color" : "rgb(102,102,102)",
      "font-size" : 12,
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "border-opacity" : 1.0,
      "background-opacity" : 1.0,
      "border-color" : "rgb(255,255,255)",
      "border-width" : 10.0,
      "text-opacity" : 1.0,
      "content" : "data(name)"
    }
  }, {
    "selector" : "node:selected",
    "css" : {
      "background-color" : "rgb(255,0,102)"
    }
  }, {
    "selector" : "edge",
    "css" : {
      "line-color" : "rgb(255,255,255)",
      "line-style" : "dashed",
      "font-family" : "SansSerif",
      "font-weight" : "normal",
      "target-arrow-color" : "rgb(255,255,255)",
      "source-arrow-shape" : "none",
      "source-arrow-color" : "rgb(255,255,255)",
      "width" : 2.0,
      "opacity" : 1.0,
      "text-opacity" : 1.0,
      "target-arrow-shape" : "triangle",
      "color" : "rgb(102,102,102)",
      "font-size" : 8,
      "content" : "data(interaction)"
    }
  }, {
    "selector" : "edge:selected",
    "css" : {
      "line-color" : "rgb(255,0,0)"
    }
  } ]
} ]