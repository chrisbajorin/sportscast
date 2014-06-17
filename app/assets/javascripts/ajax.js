// $(function(){

//   $.ajax({

//         url : "http://api.wunderground.com/api/#{ENV['WUNDERGROUND_CLIENT_ID']}/history_20100405/q/CA/San_Francisco.json",
//         dataType : "jsonp",
//         success : function(parsed_json) {

//         var historical_date = parsed_json['history']['observations'][0]['date']['pretty'];
//         var location = parsed_json['history']['observations'][0]['date']['tzname'];
//         var temperature = parsed_json['history']['observations'][0]['tempi'];

//         array_temp = parseInt(temperature);
//         }.done(function(data){

//         })
//   }); // end of ajax call
// }); //end of document ready












//////////////// CHRIS //////////////

// works with any sport if you pass in the url path. will need to be edited
// once we are rendering on a single page.
function checkWeatherCache(path) {
    var $weatherList = $("#weather-list");

    $.ajax({
        url: path,
        type: "GET",
        dataType: "json"
    }).done(function(data) {
        console.log(data)

        data.forEach(function(weather){
            console.log(weather)
            var weatherTemplate = _.template($("#weatherTemplate").html(), weather);
            $weatherList.append(weatherTemplate);
        })
   });
}



function getTeamGames(sport, team_name) {
    sport = sport ="s";
    $.ajax({
        url: sport+"/name="+team_name,
        type: "GET",
        dataType: "json"
    }).done(function(data){
         console.log(data);
    })
}

