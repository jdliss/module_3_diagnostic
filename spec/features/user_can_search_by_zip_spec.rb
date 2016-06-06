require 'rails_helper'


feature 'user can search by zip' do
  scenario 'successfully' do
    Station.create(
      name: "Station 1",
      address: "address",
      fuel_types: "ELEC",
      distance: 0.5,
      access_times: "all day"
    )

    visit root_path

    fill_in 'q', with: "80203"

  end
end
