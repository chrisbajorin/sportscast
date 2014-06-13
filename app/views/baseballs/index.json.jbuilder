json.array!(@baseballs) do |baseball|
  json.extract! baseball, :id, :date, :away_team, :home_team, :time, :city, :state, :zip
  json.url baseball_url(baseball, format: :json)
end
