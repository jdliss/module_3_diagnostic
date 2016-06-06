class Station < ActiveRecord::Base
  def self.get(zip)
    SearchService.new.populate(zip)
    all
  end
end
