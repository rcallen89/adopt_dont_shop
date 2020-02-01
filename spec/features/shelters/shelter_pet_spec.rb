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
                         age: "1",
                         sex: "F",
                         description: 'butthead',
                         image: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg',
                         status: "available",
                         shelter_id: mike.id)

      visit "/shelters/#{mike.id}/pets"
      
      expect(page).to have_css("img[src*='#{pet_2.image}']")
      expect(page).to have_content("Athena")
      expect(page).to have_content("1")
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
                         age: "1 year old",
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
      fill_in 'age', with: '5'
      fill_in 'sex', with: 'M'

      click_on "Create Pet"

      expect(current_path).to eq("/shelters/#{mike.id}/pets")
      
      expect(page).to have_content("Ripley")
    end
  end
end

RSpec.describe "Shelter Pet Index Page Update", type: :feature do
  context "as a user" do
    it "can see a update button for each pet" do
      mike = Shelter.create(name: "Mike's Shelter",
               address: "1331 17th Street",
               city: 'Denver',
               state: 'CO',
               zip: '80202')

      pet_1 = Pet.create(name: "Athena",
                age: "1",
                sex: "F",
                description: 'butthead',
                image: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg',
                status: "available",
                shelter_id: mike.id)

      visit "/shelters/#{mike.id}/pets"

      expect(page).to have_button("Update Pet", count: mike.pets.count)

      click_on("Update Pet", id: pet_1.name)

      expect(current_path).to eq("/pets/#{pet_1.id}/edit")
      expect(page).to have_content("Athena")
    end

    it "can see a delete button for each pet" do
      mike = Shelter.create(name: "Mike's Shelter",
               address: "1331 17th Street",
               city: 'Denver',
               state: 'CO',
               zip: '80202')

      pet_1 = Pet.create(name: "Athena",
                age: "1",
                sex: "F",
                description: 'butthead',
                image: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg',
                status: "available",
                shelter_id: mike.id)

      visit "/shelters/#{mike.id}/pets"

      expect(page).to have_button("Delete Pet", count: mike.pets.count)

      click_on("Delete Pet", id: "#{pet_1.name}-delete")

      expect(current_path).to eq("/pets")
      expect(page).to_not have_content("Athena")
    end
  end
end