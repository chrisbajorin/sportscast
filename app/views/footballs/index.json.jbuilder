json.array!(@footballs) do |football|
  json.extract! football, :id, :date, :away_team, :home_team, :time, :city, :state, :zip
  json.url football_url(football, format: :json)
end
