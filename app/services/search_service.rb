class SearchService
  def initialize
    @conn = Faraday.new(url: "http://developer.nrel.gov/api/alt-fuel-stations/v1/")
    @conn.headers["X-Api-Key"] = "DCOEXEwnPoZE0mYItRTJQds02xvsoXMHkvcCmYEe"
  end

  def search(zip, radius=6.0)
    @conn.get "nearest.json", { location: zip, radius: radius}
  end

  def search_response(zip, radius=6.0)
    response = search(zip, radius)
    require "pry"; binding.pry
  end
end
