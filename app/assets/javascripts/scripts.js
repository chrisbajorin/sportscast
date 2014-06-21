///////////// D3 data functions /////////////

// for breaking the database weather strings into number arrays.
// if NaN, replaces with -1 for easier data manipulation with d3.
function splitToNumArray(string){
  var results_array = [];
  var temp_array = string.split(",");
  temp_array.forEach(function(num) {
    results_array.push(parseFloat(num));
  });
  results_array.forEach(function(x,i) {
    if (isNaN(x)) {
      results_array[i] = -1;
    }
  })
  return results_array;
}


function maxOfArray(numArray){
  return Math.max.apply(null, numArray);
}

function minOfArray(numArray){
  return Math.min.apply(null, numArray);
}

function combineMinMeanMax(minArray, meanArray, maxArray){
  var dataset = [];
  for (i=0; i < minArray.length; i++) {
    var combinedArray = [];
    combinedArray[0] = minArray[i];
    combinedArray[1] = meanArray[i];
    combinedArray[2] = maxArray[i];
    dataset.push(combinedArray);
  }
  return dataset;
}


// calendar functionality
function sortCalendarData(objects, team_id) {
  var teamName = team_id.split("_").join(" ");
  var gameObjects = {};
  objects.forEach(function(game){
    if ( game.home_team == teamName ){
      var dateArray = game.date.split("-");
      var dateString = (dateArray[1]+"-"+dateArray[2]+"-"+dateArray[0]);
      gameObjects[dateString] = ("<a class='calendar_entry' href=\"baseballs/"+game.id+"\"><p>" + game.away_team + " @<br> " + game.home_team + "</p><p class='game_time'>" + game.time + "</p></a>");
    }
  });
  return gameObjects;
}

$(document).foundation({
  dropdown: {
    active_class: 'open'
  }
});


function makeBoxes(dataset) {
// console.log(dataset)
  var margin = {top: 50, right: 400, bottom: 20, left: 400},
  // padding = 30,
  // width = 400,
  // height = 200,
  width = 1350 - margin.left - margin.right,
  height = 500 - margin.top - margin.bottom,

  // var height = 300,
  // width = 800,
  barPad = 60,
  gWidth = width /dataset.length,
  barWidth = gWidth - barPad,
  dataObjects = [];

  var absMin = Infinity,
  absMax = -Infinity;

  dataset.forEach(function(d){
    if (d[0] < absMin) {
      absMin = d[0];
    }
    if (d[2] > absMax) {
      absMax = d[2];
    }
  });

  var pixPerTemp = height / (absMax - absMin);

  dataset.forEach(function(d,i){
    var min = d[0],
    mean = d[1],
    max = d[2],
    rects = [],
    minRect = {},
    maxRect = {};

    minRect['rx'] = i * gWidth
    minRect['ry'] = pixPerTemp * (absMax - mean)
    minRect['rheight'] = pixPerTemp * (mean-min)
    minRect['rwidth'] =  barWidth
    minRect['color'] = 'blue';

    maxRect['rx'] = i * gWidth
    maxRect['ry'] = pixPerTemp * (absMax - max)
    maxRect['rheight'] = pixPerTemp * (max-mean);
    maxRect['rwidth'] = barWidth;
    maxRect['color'] = 'red';
    rects.push(minRect, maxRect);

    dataObjects.push(rects);
  })
  console.log(dataObjects)

  var svg = d3.select(".bkgd_image_light").append("svg")
  .attr("class", "weather-svg");

  // var g = d3.select("weather-svg")
  // .append("g")
  // .attr("class", "graph-container")

  var g = svg.selectAll("g")
  // var g = d3.select("weather-svg")
  .data(dataObjects)
  .enter()
  .append("g")
  .attr("class", "year-g")
  .attr("id", function(d,i) {
    return "g-" + i;
  })

  g.selectAll("rect")
  .data(function(d) {return d; })
  .enter()
  // .attr("height", function(d) { return d.rheight})
  .append("rect")
  .attr("x", function(d) { return d.rx + 60})
  .attr("y", function(d,i) {
    if (i === 0) {
      return d.ry ;
    } else {
      return d.ry + d.rheight;
    };
  })
// return d.rheight - d.ry})
.attr("height", 0)
// .attr("y", 0)
// .attr("x", 0)
.attr("width", function(d) {return d.rwidth})
.style("fill", "yellow")
.transition()
.duration(1000)
.ease("linear")
.attr("x", function(d) { return d.rx + 60})
.attr("y", function(d) { return d.ry})
.attr("height", function(d) { return d.rheight})
.attr("width", function(d) {return d.rwidth})
.style("fill", function(d) { return d.color })
}


///////////   AXES  ///////////////////////////

function make_axes(dataset){

var absMin = Infinity;
var absMax = -Infinity;

dataset.forEach(function(d){
  if (d[0] < absMin) {
    absMin = d[0];
  }
  if (d[2] > absMax) {
    absMax = d[2];
  }
});

var margin = {top: 20, right: 0, bottom: 20, left: 0},
width = 600 - margin.left - margin.right,
height = 500 - margin.top - margin.bottom;

var formatNumber = d3.format(".1f");

var y = d3.scale.linear()
.domain([absMin, absMax])
.range([height, 0]);

var x = d3.time.scale()
.domain([new Date(2013, 7, 1), new Date(2007, 7, 1)])
.range([0, width]);

var xAxis = d3.svg.axis()
.scale(x)
.ticks(d3.time.years)
.orient("bottom");

var yAxis = d3.svg.axis()
.scale(y)
.tickSize(width)
.tickFormat(formatTemperature)
.orient("right");

var svg = d3.select("svg").append("svg")
.attr("class", "axes_graph")
.attr("width", width + margin.left + margin.right)
.attr("height", height + margin.top + margin.bottom)
.append("g")
.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

svg.append("g")
.attr("class", "x axis")
.attr("transform", "translate(0," + height + ")")
.call(xAxis);

var gy = svg.append("g")
.attr("class", "y axis")
.call(yAxis);

gy.selectAll("g").filter(function(d) { return d; })
.classed("minor", true);

gy.selectAll("text")
.attr("x", 4)
.attr("dy", -4);

function formatTemperature(d) {
  var s = formatNumber(d / 1);
  return d === y.domain()[1]
  ?  s + " degrees"
  : s;
}
} // end of the function make_axes



