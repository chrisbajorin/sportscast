module BaseballsHelper

  # def call_weather_api(sport, game_id)
  #   mintemp = []
  #   meantemp = []
  #   maxtemp = []
  #   minwind = []
  #   meanwind = []
  #   maxwind = []
  #   precip = []
  #   cldcvr = []
  #   humid = []

  #   if sport.downcase == "baseball"
  #     game = Baseball.where("game_id = ?", game_id)
  #   elsif sport.downcase == "football"
  #     game = Football.where("game_id = ?", game_id)
  #   end

  #   for i in 1..10
  #     date_array = game.date.split("-")
  #     date_array[0] = date_array[0].to_i - i
  #     game_date = date_array.join("-")
  #     url = "http://api.wunderground.com/api/#{ENV['WUNDERGROUND_CLIENT_ID']}/history_#{game_date.gsub(/-/,"")}/q/#{game[:state]}/#{game[:city].gsub(/ /,"_")}.json"
  #     response = HTTParty.get(url)
  #     if response["response"] != nil
  #       mintemp << response['history']['dailysummary'][0]["mintempi"]
  #       meantemp << response['history']['dailysummary'][0]["meantempi"]
  #       maxtemp << response['history']['dailysummary'][0]["maxtempi"]
  #       minwind << response['history']['dailysummary'][0]["minwspdi"]
  #       meanwind << response['history']['dailysummary'][0]["meanwindspdi"]
  #       maxwind << response['history']['dailysummary'][0]["maxwspdi"]
  #       precip << response['history']['dailysummary'][0]["precipi"]
  #       cldcvr << response['history']['observations'][15]["conds"]
  #       humid << response['history']['dailysummary'][0]["humidity"]
  #     else
  #       mintemp << "0"
  #       meantemp << "0"
  #       maxtemp << "0"
  #       minwind << "0"
  #       meanwind << "0"
  #       maxwind << "0"
  #       precip << "0"
  #       cldcvr << "0"
  #       humid << "0"
  #     end
  #     sleep 0.075
  #   end
  #   cache = Weather.new({
  #     sport: "#{sport}",
  #     game_id: game.game_id,
  #     min_temp: mintemp.join(","),
  #     mean_temp: meantemp.join(","),
  #     max_temp: maxtemp.join(","),
  #     min_wind: minwind.join(","),
  #     mean_wind: meanwind.join(","),
  #     max_wind: maxwind.join(","),
  #     precipitation: precip.join(","),
  #     cloud_cover: cldcvr.join(","),
  #     humidity: hum.join(",")
  #   })
  #   cache.save
  # end

end
