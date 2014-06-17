
$(document).ready(function(){

  // For box plot begins:
  var margin = {top: 10, right: 50, bottom: 20, left: 50},
  width = 120 - margin.left - margin.right,
  height = 500 - margin.top - margin.bottom;


  var min = Infinity,
  max = -Infinity;

  var chart = d3.box()
  .whiskers(iqr(1.3))
  .width(width)
  .height(height);
  // For box plot ends

  //For axis begins:
  var margin = {top: 20, right: 0, bottom: 20, left: 0},
  width = 960 - margin.left - margin.right,
  height = 500 - margin.top - margin.bottom;

  var formatNumber = d3.format(".1f");

  var y = d3.scale.linear()
  .domain([0, 1e6])
  .range([height, 0]);

  var x = d3.time.scale()
  .domain([new Date(2005, 7, 1), new Date(2014, 6, 1)])
  .range([0, width]);

  var xAxis = d3.svg.axis()
  .scale(x)
  .ticks(d3.time.years)
  .tickSize(6, 0)
  .orient("bottom");

  var yAxis = d3.svg.axis()
  .scale(y)
  .tickSize(width)
  .tickFormat(formatTemperature)
  .orient("right");

  var svg = d3.select("body").append("svg")
  .attr("width", width + margin.left + margin.right)
  .attr("height", height + margin.top + margin.bottom)
  .append("g")
  .attr("transform", "translate(" + margin.left + "," + margin.top + ")");


  var gy = svg.append("g")
  .attr("class", "y axis")
  .call(yAxis)
  .call(customAxis);

  var gx = svg.append("g")
  .attr("class", "x axis")
  .attr("transform", "translate(0," + height + ")")
  .call(xAxis);

  setTimeout(function() {
    y.domain([0, 3e6]);

    gy.transition()
    .duration(2500)
    .call(yAxis)
    .selectAll("text") // cancel transition on customized attributes
    .tween("attr.x", null)
    .tween("attr.dy", null);

    gy.call(customAxis);
  }, 1000);

  function customAxis(g) {
    g.selectAll("text")
    .attr("x", 4)
    .attr("dy", -4);
  }

  function formatTemperature(d) {
    var s = formatNumber(d / 1e6);
    return d === y.domain()[1]
    ? "$" + s + " degrees"
    : s;
  }

  //For axis ends


  // d3.json("/wunderground.json", function(error, json) {
  //   // var data; // a globals

  //   // data = json;
  //   console.log(json);
  //   // visualizeit();
  // });

  // Need to convert this to json
  d3.csv("/morley.csv", function(error, csv) {
    var data = [];
    console.log(csv);

    csv.forEach(function(x,y) {
      console.log(x);
      var e = Math.floor(x.Expt-1),
      r = Math.floor(x.Run-1),
      s = Math.floor(x.Speed),
      d = data[e];
      if (!d) d = data[e] = [s];
      else d.push(s);
        if (s > max) max = s;
          if (s < min) min = s;
          });


          chart.domain([min, max]);

//svg append for box plot
   svg.selectAll("svg")
          .data(data)
          .enter().append("svg")
          .attr("class", "box")
          .attr("box", 3.5)
          .attr("width", width + margin.left + margin.right)
          .attr("height", height + margin.bottom + margin.top)
          .append("g")
          .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
          .call(chart);

//original box plot append box
          // var svg = d3.select("body").selectAll("svg")
          // .data(data)
          // .enter().append("svg")
          // .attr("class", "box")
          // .attr("width", width + margin.left + margin.right)
          // .attr("height", height + margin.bottom + margin.top)
          // .append("g")
          // .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
          // .call(chart);

          setInterval(function() {
            svg.datum(randomize).call(chart.duration(1000));
          }, 2000);
        });

        function randomize(d) {
          if (!d.randomizer) d.randomizer = randomizer(d);
            return d.map(d.randomizer);
          }

          function randomizer(d) {
            var k = d3.max(d) * .02;
            return function(d) {
              return Math.max(min, Math.min(max, d + k * (Math.random() - .5)));
            };
          }

          // Returns a function to compute the interquartile range.
          function iqr(k) {
            return function(d, i) {
              var q1 = d.quartiles[0],
              q3 = d.quartiles[2],
              iqr = (q3 - q1) * k,
              i = -1,
              j = d.length;
              while (d[++i] < q1 - iqr);
                while (d[--j] > q3 + iqr);
                  return [i, j];
                };
              }


            });



