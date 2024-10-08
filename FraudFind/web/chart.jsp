<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
canvas {
            display:block;
            margin:10px auto;
            border:1px solid black;
        }
</style>
</head>
<body>
<script type="text/javascript">
/*
* This is NOT free software. You may learn from and experiment with this code but you may not redistribute it or use it in any commercial application without the explicit prior consent of the author.
* Burak Kanber
* burak@burakkanber.com
* October 2012
*/

var canvas; 
var ctx;
var height = 400;
var width = 400;
   var data = [
   [1, 2],
   [2, 1],
   [2, 4], 
   [1, 3],
   [2, 2],
   [3, 1],
   [1, 1],

   [7, 3],
   [8, 2],
   [6, 4],
   [7, 4],
   [8, 1],
   [9, 2],

   [10, 8],
   [9, 10],
   [7, 8],
   [7, 9],
   [8, 11],
   [9, 9],
];
var means = [];
var assignments = [];
var dataExtremes;
var dataRange;
var drawDelay = 2000;

function setup() {

   canvas = document.getElementById('canvas');
   ctx = canvas.getContext('2d');

   dataExtremes = getDataExtremes(data);
   dataRange = getDataRanges(dataExtremes);
   means = initMeans(3);

   makeAssignments();
   draw();

   setTimeout(run, drawDelay);
}

function getDataRanges(extremes) {
   var ranges = [];

   for (var dimension in extremes)
   {
       ranges[dimension] = extremes[dimension].max - extremes[dimension].min;
   }

   return ranges;

}

function getDataExtremes(points) {
   
   var extremes = [];

   for (var i in data)
   {
       var point = data[i];

       for (var dimension in point)
       {
           if ( ! extremes[dimension] )
           {
               extremes[dimension] = {min: 1000, max: 0};
           }

           if (point[dimension] < extremes[dimension].min)
           {
               extremes[dimension].min = point[dimension];
           }

           if (point[dimension] > extremes[dimension].max)
           {
               extremes[dimension].max = point[dimension];
           }
       }
   }

   return extremes;

}

function initMeans(k) {

   if ( ! k )
   {
       k = 3;
   }

   while (k--)
   {
       var mean = [];

       for (var dimension in dataExtremes)
       {
           mean[dimension] = dataExtremes[dimension].min + ( Math.random() * dataRange[dimension] );
       }

       means.push(mean);
   }

   return means;

};

function makeAssignments() {

   for (var i in data)
   {
       var point = data[i];
       var distances = [];

       for (var j in means)
       {
           var mean = means[j];
           var sum = 0;

           for (var dimension in point)
           {
               var difference = point[dimension] - mean[dimension];
               difference *= difference;
               sum += difference;
           }

           distances[j] = Math.sqrt(sum);
       }

       assignments[i] = distances.indexOf( Math.min.apply(null, distances) );
   }

}

function moveMeans() {

   makeAssignments();

   var sums = Array( means.length );
   var counts = Array( means.length );
   var moved = false;

   for (var j in means)
   {
       counts[j] = 0;
       sums[j] = Array( means[j].length );
       for (var dimension in means[j])
       {
           sums[j][dimension] = 0;
       }
   }

   for (var point_index in assignments)
   {
       var mean_index = assignments[point_index];
       var point = data[point_index];
       var mean = means[mean_index];

       counts[mean_index]++;

       for (var dimension in mean)
       {
           sums[mean_index][dimension] += point[dimension];
       }
   }

   for (var mean_index in sums)
   {
       console.log(counts[mean_index]);
       if ( 0 === counts[mean_index] ) 
       {
           sums[mean_index] = means[mean_index];
           console.log("Mean with no points");
           console.log(sums[mean_index]);

           for (var dimension in dataExtremes)
           {
               sums[mean_index][dimension] = dataExtremes[dimension].min + ( Math.random() * dataRange[dimension] );
           }
           continue;
       }

       for (var dimension in sums[mean_index])
       {
           sums[mean_index][dimension] /= counts[mean_index];
       }
   }

   if (means.toString() !== sums.toString())
   {
       moved = true;
   }

   means = sums;

   return moved;

}

function run() {

   var moved = moveMeans();
   draw();

   if (moved)
   {
       setTimeout(run, drawDelay);
   }

}
function draw() {

   ctx.clearRect(0,0,width, height);

   ctx.globalAlpha = 0.3;
   for (var point_index in assignments)
   {
       var mean_index = assignments[point_index];
       var point = data[point_index];
       var mean = means[mean_index];

       ctx.save();

       ctx.strokeStyle = 'blue';
       ctx.beginPath();
       ctx.moveTo(
           (point[0] - dataExtremes[0].min + 1) * (width / (dataRange[0] + 2) ),
           (point[1] - dataExtremes[1].min + 1) * (height / (dataRange[1] + 2) )
       );
       ctx.lineTo(
           (mean[0] - dataExtremes[0].min + 1) * (width / (dataRange[0] + 2) ),
           (mean[1] - dataExtremes[1].min + 1) * (height / (dataRange[1] + 2) )
       );
       ctx.stroke();
       ctx.closePath();
   
       ctx.restore();
   }
   ctx.globalAlpha = 1;

   for (var i in data)
   {
       ctx.save();

       var point = data[i];

       var x = (point[0] - dataExtremes[0].min + 1) * (width / (dataRange[0] + 2) );
       var y = (point[1] - dataExtremes[1].min + 1) * (height / (dataRange[1] + 2) );

       ctx.strokeStyle = '#333333';
       ctx.translate(x, y);
       ctx.beginPath();
       ctx.arc(0, 0, 5, 0, Math.PI*2, true);
       ctx.stroke();
       ctx.closePath();

       ctx.restore();
   }

   for (var i in means)
   {
       ctx.save();

       var point = means[i];

       var x = (point[0] - dataExtremes[0].min + 1) * (width / (dataRange[0] + 2) );
       var y = (point[1] - dataExtremes[1].min + 1) * (height / (dataRange[1] + 2) );

       ctx.fillStyle = 'green';
       ctx.translate(x, y);
       ctx.beginPath();
       ctx.arc(0, 0, 5, 0, Math.PI*2, true);
       ctx.fill();
       ctx.closePath();

       ctx.restore();

   }

}

setup();
</script>
<canvas id="canvas" height="400" width="400"></canvas>
</body>
</html>