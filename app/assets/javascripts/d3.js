// <style>

// .chart div {
//   font: 10px sans-serif;
//   background-color: steelblue;
//   text-align: right;
//   padding: 3px;
//   margin: 1px;
//   color: white;
// }

// </style>
// <div class="chart"></div>
// <script>

// // called from ajax.js array_temp variable
// var data = [array_temp, 8, 15, 16, 23, 42];

//         var x = d3.scale.linear()
//             .domain([0, d3.max(data)])
//             .range([0, 420]);

//         d3.select(".chart")
//           .selectAll("div")
//             .data(data)
//           .enter().append("div")
//             .style("width", function(d) { return x(d) + "px"; })
//             .text(function(d) { return d; });
// </script>

function displayTemperatureD3(mindata, meandata, maxdata) {



  var height = 400,
      width = 800,
      barPadding = 2,
      max = maxOfArray(dataset);


////////////// working crappy version //////////////

  var svg = d3.select("body").append("svg");
  svg.attr({
    height: height,
    width: width
  });

  var rect = svg.selectAll("svg")
    .data(dataset)
    .enter()
    .append("rect");

  // x is the starting point from the left
  rect.attr("x", function(d,i) {
    return i * (width / dataset.length);
  })
  //y is the starting point from the top
  rect.attr("y", function(d) {
    return height - d;
  });
  rect.attr("width", width / dataset.length - barPadding);
  rect.attr("height", function(d){
    return d;
  });

}
