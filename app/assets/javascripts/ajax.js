$(function(){

  $.ajax({

        url : "http://api.wunderground.com/api/#{ENV['WUNDERGROUND_CLIENT_ID']}/history_20100405/q/CA/San_Francisco.json",
        dataType : "jsonp",
        success : function(parsed_json) {

        var historical_date = parsed_json['history']['observations'][0]['date']['pretty'];
        var location = parsed_json['history']['observations'][0]['date']['tzname'];
        var temperature = parsed_json['history']['observations'][0]['tempi'];

        array_temp = parseInt(temperature);
        }.done(function(data){

        })
  }); // end of ajax call
}); //end of document ready
