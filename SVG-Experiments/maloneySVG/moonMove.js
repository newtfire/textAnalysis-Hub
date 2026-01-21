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

svg.addEventListener("mousedown", function(e) {
  anchorPoint = svgCoords(event, svg);
  window.addEventListener("mousemove", move);
  window.addEventListener("mouseup", cancelMove);
});

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
