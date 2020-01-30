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

RSpec.describe 'shelter show page with update', type: :feature do
  context 'as a user' do
    it 'can see link to update shelter information' do
      shelter_1 = Shelter.create(name: 'Pets R Us',
                                 address: '123 Main St',
                                 city: 'Denver',
                                 state: 'CO',
                                 zip: '80134')

      visit "/shelters/#{shelter_1.id}"
      
      click_on "Update Shelter"

      expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
    end
  end
end

RSpec.describe 'shelter show delete', type: :feature do
  context 'as a user' do
    it 'has a delete link and reroutes to shelter index' do
      shelter_1 = Shelter.create(name: 'Pets R Us',
                                 address: '123 Main St',
                                 city: 'Denver',
                                 state: 'CO',
                                 zip: '80134')

      visit "/shelters/#{shelter_1.id}"
    
      click_on "Delete Shelter"

      expect(current_path).to eq('/shelters')

      expect(page).not_to have_content("#{shelter_1.name}")
    end
  end
end