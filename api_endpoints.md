WEATHERSOURCE

DATE FORMAT: YYYY-MM-DD

https://api.weathersource.com/v1/"#{WEATHERSOURCE_CLIENT_ID}"/history_by_postal_code.format

url = "https://api.weathersource.com/v1/#{ENV['WEATHERSOURCE_CLIENT_ID']}/history_by_postal_code.json?period=day&postal_code_eq=#{game[:zip]}&country_eq=US&timestamp_eq=#{game[:date]}&fields=tempMax,tempAvg,tempMin,precip,snowfall,windSpdMax,windSpdAvg,windSpdMin,cldCvrAvg,relHumAvg"
response = HTTParty.get(url)

tempMin
tempAvg
tempMax
windSpdMin
windSpdAvg
windSpdMax
precip
snowfall
cldCvrAvg
relHumAvg


WEATHERUNDERGROUND

DATE FORMAT: YYYYMMDD
CITY FORMAT: San_Francisco ( game.city.gsub(/ /, "_") )

url = "http://api.wunderground.com/api/#{ENV['WUNDERGROUND_CLIENT_ID']}/history_#{game[:date].gsub(/-/,"")}/q/#{game[:state]}/#{game[:city].gsub(/ /,"_")}.json"
response = HTTParty.get(url)
response['history']['dailysummary'][0]['date']['pretty'] => "12:00 PM EDT on June 06, 2014"
response['history']['dailysummary'][0]:
  # **i is imperial**
  ['mintempi'] = min temp(F)
  ['meantempi'] = average temp
  ['maxtempi'] = max temp
  ['minwspdi'] = min wind speed (mph)
  ['meanwindspdi'] = average wind speed
  ['maxwspdi'] = max wind speed
  ['precipi'] = inches of precipitation
  ['rain'] = 0/1 boolean
response['history']['observations'][15] = 3pm (we could process the time from the game instance)
  ['conds']
  ['icon'] = "http://icons.wxug.com/i/c/c/#{['icon']}.gif"
