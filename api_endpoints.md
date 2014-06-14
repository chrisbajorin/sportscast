WEATHERSOURCE

https://api.weathersource.com/v1/"#{WEATHERSOURCE_CLIENT_ID}"/history_by_postal_code.format

data = {
  zip: "10583",
  date: "2012-02-10"
}

url = "https://api.weathersource.com/v1/#{ENV['WEATHERSOURCE_CLIENT_ID']}/history_by_postal_code.json?period=day&postal_code_eq=#{data[:zip]}&country_eq=US&timestamp_eq=#{data[:date]}&fields=tempMax,tempAvg,tempMin,precip,snowfall,windSpdMax,windSpdAvg,windSpdMin,cldCvrMax,cldCvrAvg,cldCvrMin,feelsLikeAvg,relHumAvg"
