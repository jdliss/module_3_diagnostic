class SearchController < ApplicationController
  def index
    @stations = Station.limit(10).get(params['q'])
  end
end
