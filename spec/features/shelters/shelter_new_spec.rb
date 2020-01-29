require 'rails_helper'

RSpec.describe 'shelter new input form', type: :feature do
  context 'as a user' do
    it 'can see a form for new shelter' do
      visit '/shelters/new'

      expect(page).to have_css('#shelter-input')
      expect(page).to have_field('name')
      expect(page).to have_field('address')
      expect(page).to have_field('city')
      expect(page).to have_field('state')
      expect(page).to have_field('zip')
      expect(page).to have_button('shelter-submit')

      fill_in 'name', with: 'Petty Pet Shop'
      fill_in 'address', with: '1010 Street Pl'
      fill_in 'city', with: 'Denver'
      fill_in 'state', with: 'CO'
      fill_in 'zip', with: '80134'

      click_button('shelter-submit')

      expect(current_path).to eq('/shelters')

      # Why Doesn't this work?
      # expect(current_path).to have_link("Petty Pet Shop")
      
    end
  end
end