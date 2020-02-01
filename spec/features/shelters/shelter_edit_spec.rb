require 'rails_helper'

RSpec.describe 'shelter edit page', type: :feature do
  context 'as a user' do
    it 'can see form with existing data to edit' do
      shelter_1 = create(:shelter)

      visit "/shelters/#{shelter_1.id}/edit"

      expect(page).to have_content("Pets R Us")

      fill_in 'name', with: 'Petty Pet Shop Edited'
      fill_in 'address', with: '1010 Street Pl'
      fill_in 'city', with: 'Denver'
      fill_in 'state', with: 'CO'
      fill_in 'zip', with: '80134'

      click_button('Update Shelter')

      expect(current_path).to eq("/shelters/#{shelter_1.id}")
      expect(page).to have_content("Petty Pet Shop Edited")
    end
  end
end