require 'rails_helper'

RSpec.describe 'Pet Show Page', type: :feature do
  context 'as a visitor' do
    it "can show pet info" do
      mike = Shelter.create(name: "Mike's Shelter",
                            address: "1331 17th Street",
                            city: 'Denver',
                            state: 'CO',
                            zip: '80202')

      pet_2 = Pet.create(name: "Athena",
                         age: "1 year old",
                         sex: "F",
                         description: 'butthead',
                         image: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg',
                         status: "available",
                         shelter_id: mike.id)

      visit "/pets/#{pet_2.id}"

      expect(page).to have_css("img[src*='#{pet_2.image}']")
      expect(page).to have_content(pet_2.name)
      expect(page).to have_content(pet_2.description)
      expect(page).to have_content(pet_2.age)
      expect(page).to have_content(pet_2.sex)
      expect(page).to have_content(pet_2.status)
    end
  end
end

RSpec.describe 'Pet Show Page Delete', type: :feature do
  context 'as a user' do
    it 'can delete a pet' do
      mike = Shelter.create(name: "Mike's Shelter",
                            address: "1331 17th Street",
                            city: 'Denver',
                            state: 'CO',
                            zip: '80202')

      pet_2 = Pet.create(name: "Athena",
                         age: "1 year old",
                         sex: "F",
                         description: 'butthead',
                         image: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg',
                         status: "available",
                         shelter_id: mike.id)

      visit "/pets/#{pet_2.id}"

      click_on "Delete Pet"

      expect(current_path).to eq('/pets')
      expect(page).to_not have_content("Athena")
    end
  end
end