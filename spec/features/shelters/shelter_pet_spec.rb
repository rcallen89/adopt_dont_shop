require 'rails_helper'

RSpec.describe 'shelter pet page', type: :feature do
  context 'as a user' do
    it 'can see each pet in that shelter' do
      mike = Shelter.create(name: "Mike's Shelter",
                            address: "1331 17th Street",
                            city: 'Denver',
                            state: 'CO',
                            zip: '80202')

      pet_2 = Pet.create(name: "Athena",
                         approximate_age: "1 year old",
                         sex: "F",
                         description: 'butthead',
                         image: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg',
                         status: "available",
                         shelter_id: mike.id)

      visit "/shelters/#{mike.id}/pets"
      
      expect(page).to have_css("img[src*='#{pet_2.image}']")
      expect(page).to have_content("Athena")
      expect(page).to have_content("1 year old")
      expect(page).to have_content("F")
    end
  end
end

RSpec.describe 'shelter pet page', type: :feature do
  context 'as a user' do
    it 'has a create pet page and makes one' do
      mike = Shelter.create(name: "Mike's Shelter",
                            address: "1331 17th Street",
                            city: 'Denver',
                            state: 'CO',
                            zip: '80202')

      pet_2 = Pet.create(name: "Athena",
                         approximate_age: "1 year old",
                         sex: "F",
                         description: 'butthead',
                         image: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg',
                         status: "available",
                         shelter_id: mike.id)

      visit "/shelters/#{mike.id}/pets"

      click_on "Create Pet"

      expect(current_path).to eq("/shelters/#{mike.id}/pets/new")

      fill_in 'image', with: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg'
      fill_in 'name', with: 'Ripley'
      fill_in 'description', with: 'Whip It'
      fill_in 'approximate_age', with: '5'
      fill_in 'sex', with: 'M'

      click_on "Create Pet"

      expect(current_path).to eq("/shelters/#{mike.id}/pets")

      expect(page).to have_content("Ripley")
    end
  end
end