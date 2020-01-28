require 'rails_helper'

RSpec.describe 'shelter show page', type: :feature do
  context 'as a user' do
    it 'can see that shelter information' do
      shelter_1 = Shelter.create(name: 'Pets R Us',
                                 address: '123 Main St',
                                 city: 'Denver',
                                 state: 'CO',
                                 zip: '80134')

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_content("Pets R Us")
      expect(page).to have_content("123 Main St")
      expect(page).to have_content("Denver")
      expect(page).to have_content("CO")
      expect(page).to have_content("80134")
    end
  end
end