var svg = document.querySelector("svg");
var anchorPoint;

function shiftViewBox(deltaX, deltaY) {
	svg.viewBox.baseVal.x += deltaX;
	svg.viewBox.baseVal.y += deltaY;
}

function svgCoords(event,elem) {
	var ctm = elem.getScreenCTM();
	var pt = svg.createSVGPoint();
	pt.x = event.clientX;
	pt.y = event.clientY;
	return pt.matrixTransform(ctm.inverse());
}

/* ebb: I added a function around this called init(). That's pretty standard for scripting
 * what you want to happen first. This function init() listens for the user to do a "mousedown" event on the SVG element,
 * and as the mouse moves, it triggers the function move(). And mouseup seems like it would undo the move, but really it just stops
 * the attachment of the mouse to the SVG. I tried removing the cancelMove function and it just meant the plot
 * kept sticking to my mouse and wouldn't stop moving!    */
function init() {svg.addEventListener("mousedown", function(e) {
  anchorPoint = svgCoords(event, svg);
  window.addEventListener("mousemove", move);
  window.addEventListener("mouseup", cancelMove);
});}

function cancelMove(e) {
  window.removeEventListener("mousemove", move);
  window.removeEventListener("mouseup", cancelMove);
  anchorPoint = undefined;
}

function move(e) {
  var targetPoint = svgCoords(event, svg);
  shiftViewBox(anchorPoint.x - targetPoint.x,
               anchorPoint.y - targetPoint.y);
}
window.onload = init;
/*  ebb: I added this function so it will fire first and trigger an initial function, which
 * I labelled above.  */