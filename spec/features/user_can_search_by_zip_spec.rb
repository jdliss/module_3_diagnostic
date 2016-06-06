require 'rails_helper'


feature 'user can search by zip' do
  scenario 'successfully' do
    visit root_path

    fill_in 'q', with: "80203"

    expect(current_path).to eq "/search?zip=80203"
  end
end
