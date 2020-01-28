require 'rails_helper'

RSpec.describe 'shelter index page show all', type: :feature do
  context 'as a user' do
    it 'can see all shelter names' do
      shelter_1 = Shelter.create(name: 'Pets R Us',
                                 address: '123 Main St',
                                 city: 'Denver',
                                 state: 'CO',
                                 zip: '80134')
      shelter_2 = Shelter.create(name: 'Petopia',
                                 address: '4343 1st St',
                                 city: 'Denver',
                                 state: 'CO',
                                 zip: '80134')

      visit '/shelters'

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_2.name)
    end
  end
end

RSpec.describe 'shelter index page new link', type: :feature do
  context 'as a user' do
    it 'has a link to go to a new shelter entry' do
      visit '/shelters'

      expect(page).to have_link("Input New Shelter")

      click_link("Input New Shelter")
      
      expect(current_path).to eq('/shelters/new')
    end
  end
end