
// works with any sport if you pass in the url path. will need to be edited
// once we are rendering on a single page.

// pulls the weather data strings for a specific game using a
function checkWeatherCache(path) {
    var $weatherList = $("#weather-list");

    $.ajax({
        url: path,
        type: "GET",
        dataType: "json"
    }).done(function(data) {
        data.forEach(function(weather){
            console.log(weather)
            var weatherTemplate = _.template($("#weatherTemplate").html(), weather);
            $weatherList.append(weatherTemplate);
        })
   });
}

