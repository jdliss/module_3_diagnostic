class SearchController < ApplicationController
  def index
    response = Station.all
  end
end
