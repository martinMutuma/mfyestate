var obj_marquee;
var marquee_spd = 4000;
var step_c = 0;
function marquee_init() {
obj_marquee = document.getElementById("marquee");
  var obj_unit = obj_marquee.firstChild;
  var n = Math.ceil(parseInt(obj_marquee.style.height) / obj_unit.offsetHeight);
  for(var i=0; i<n; i++) obj_marquee.appendChild(obj_unit.cloneNode(true));
setInterval("step_c=0;setTimeout('marquee_show()',50)", marquee_spd);
  return;
}
function marquee_show() {
  var marquee_high = parseInt(obj_marquee.style.height);
  var step = marquee_high/14;
  if(obj_marquee.scrollTop >= obj_marquee.children[1].offsetTop) {
    obj_marquee.scrollTop = 0;
    marquee_show();
    return;
  }
  obj_marquee.scrollTop += step;
  if(step_c++ < 15) setTimeout("marquee_show()", 50);
  return;
}
if(document.getElementById("listnull").value=="1"){

window.onload=marquee_init;
}