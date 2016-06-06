require 'rails_helper'

describe SearchService do
  describe '#locate' do
    it 'returns 10 closest stations' do
      VCR.use_cassette 'search_service/locate' do
        service = SearchService.new
        response = service.search("80203")
        require "pry"; binding.pry
      end
    end
  end
end
