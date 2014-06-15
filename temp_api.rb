giants_games = Football.where("home_team = ?", "New York Giants")

giants_games.each do |game|
  url = "https://api.weathersource.com/v1/#{ENV['WEATHERSOURCE_CLIENT_ID']}/history_by_postal_code.json?period=day&postal_code_eq=#{game[:zip]}&country_eq=US&timestamp_eq=#{game[:date]}&fields=tempMax,tempAvg,tempMin,precip,snowfall,windSpdMax,windSpdAvg,windSpdMin,cldCvrAvg,relHumAvg"
  response = HTTParty.get(url)
