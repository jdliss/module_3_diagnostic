class SearchService
  def initialize
    @conn = Faraday.new(url: "http://developer.nrel.gov/api/alt-fuel-stations/v1/")
    @conn.headers["X-Api-Key"] = "DCOEXEwnPoZE0mYItRTJQds02xvsoXMHkvcCmYEe"
  end

  def search(zip, radius=6.0)
    @conn.get "nearest.json", { location: zip, radius: radius}
  end

  def populate(zip, radius=6.0)
    response = search(zip, radius)
    body = JSON.parse(response.body)
    stations = body["fuel_stations"].select do |station|
      station['fuel_type_code'].include?("ELEC") || station['fuel_type_code'].include?("LPG")
    end
    save_stations(stations)
  end

  def save_stations(stations)
    stations.each do |station|
      Station.find_or_create_by(
        name: station["station_name"],
        address: station["street_address"],
        fuel_types: station['fuel_type_code'],
        distance: station["distance"].to_s,
        access_times: station["access_days_time"]
      )
    end
  end
end
