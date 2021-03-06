require 'rails_helper'

RSpec.describe 'shelter index page show all', type: :feature do
  before :each do
    @shelter_1 = create(:shelter)
    @shelter_2 = create(:shelter, name: "Meg's Shelter")
  end
  context 'as a user' do
    it 'can see all shelter names' do
      

      visit '/shelters'

      expect(page).to have_link(@shelter_1.name)
      expect(page).to have_link(@shelter_2.name)
    end
  end

  context 'as a user' do
    it 'has a link to go to a new shelter entry' do
      visit '/shelters'

      click_link("New Shelter")
      
      expect(current_path).to eq('/shelters/new')
    end
  end

  context 'as a user' do
    it 'has a update button next to every shelter' do

      visit '/shelters'

      expect(page).to have_button('Update Shelter', count: Shelter.all.count)
      
      click_on("Update Shelter", id: @shelter_1.name)

      expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
    end
  end

  context 'as a user' do
    it 'has a delete button next to every shelter' do

      visit '/shelters'

      expect(page).to have_button('Delete Shelter', count: Shelter.all.count)

      click_on("Delete Shelter", id: "#{@shelter_1.name}-delete")

      expect(page).to_not have_content("Pets R Us")
    end
  end
end