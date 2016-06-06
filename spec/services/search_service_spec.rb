require 'rails_helper'

describe SearchService do
  describe '#locate' do
    it 'returns 10 closest stations' do
      VCR.use_cassette 'search_service/search' do
        service = SearchService.new
        response = service.search("80203")
        parsed = JSON.parse(response.body)
        expect(parsed["total_results"]).to eq 71
      end
    end
  end
end
