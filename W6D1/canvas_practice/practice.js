document.addEventListener("DOMContentLoaded", function(){

  const canvAss = document.getElementById("mycanvas");
  canvAss.height = 500;
  canvAss.width = 500;

  const ctx = canvAss.getContext("2d");  
  ctx.fillStyle = "purple";
  ctx.fillRect(0,0, 500, 500);

  ctx.beginPath();
  ctx.arc(200, 200, 100, 0, 2*Math.PI);
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fillStyle = "red";
  ctx.fill();

  //phase 4
  ctx.clearRect(0,0,500,500);
});

