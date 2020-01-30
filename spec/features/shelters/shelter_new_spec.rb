require 'rails_helper'

RSpec.describe 'shelter new input form', type: :feature do
  context 'as a user' do
    it 'can see a form for new shelter' do
      visit '/shelters/new'

      fill_in 'name', with: 'Petty Pet Shop'
      fill_in 'address', with: '1010 Street Pl'
      fill_in 'city', with: 'Denver'
      fill_in 'state', with: 'CO'
      fill_in 'zip', with: '80134'

      click_button('Create Shelter')

      expect(current_path).to eq('/shelters')

      expect(page).to have_content("Petty Pet Shop")
    end
  end
end