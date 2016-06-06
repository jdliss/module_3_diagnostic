class SearchService
  def initialize
    @conn = Faraday.new(url: "http://developer.nrel.gov/api/alt-fuel-stations/v1/")
    @conn.headers["X-Api-Key"] = "DCOEXEwnPoZE0mYItRTJQds02xvsoXMHkvcCmYEe"
  end

  def search(zip)
    @conn.get("nearest.json?location=#{zip}")
  end
end
