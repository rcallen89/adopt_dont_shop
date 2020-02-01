require 'rails_helper'

RSpec.describe 'pet index page all', type: :feature do
  context 'as a user' do
    it 'can see all pets in system' do
      mike = Shelter.create(name: "Mike's Shelter",
               address: "1331 17th Street",
               city: 'Denver',
               state: 'CO',
               zip: '80202')

      meg = Shelter.create(name: "Meg's Shelter",
                    address: "150 Main Street",
                    city: 'Hershey',
                    state: 'PA',
                    zip: '17033')

      pet_1 = Pet.create(name: "Athena",
                age: "1",
                sex: "F",
                description: 'butthead',
                image: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg',
                status: "available",
                shelter_id: mike.id)

      pet_2 = Pet.create(name: "Odell",
                age: "4",
                sex: "M",
                description: 'good dog',
                image: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg',
                status: "available",
                shelter_id: meg.id)

      visit '/pets'


      expect(page).to have_css("img[src*='#{pet_2.image}']")
      expect(page).to have_content("Athena")
      expect(page).to have_content("4")
      expect(page).to have_content("M")
      expect(page).to have_content("#{meg.name}")
    end
  end
end

RSpec.describe "Pet Index Page Update", type: :feature do
  context "as a user" do
    it "can see a update button for each pet" do
      mike = Shelter.create(name: "Mike's Shelter",
               address: "1331 17th Street",
               city: 'Denver',
               state: 'CO',
               zip: '80202')

      meg = Shelter.create(name: "Meg's Shelter",
                    address: "150 Main Street",
                    city: 'Hershey',
                    state: 'PA',
                    zip: '17033')

      pet_1 = Pet.create(name: "Athena",
                age: "1",
                sex: "F",
                description: 'butthead',
                image: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg',
                status: "available",
                shelter_id: mike.id)

      pet_2 = Pet.create(name: "Odell",
                age: "4",
                sex: "M",
                description: 'good dog',
                image: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg',
                status: "available",
                shelter_id: meg.id)

      visit '/pets'

      expect(page).to have_button("Update Pet", count: Pet.all.count)

      click_on("Update Pet", id: pet_2.name)

      expect(current_path).to eq("/pets/#{pet_2.id}/edit")
      expect(page).to have_content("Odell")
    end

    it "can see a delete button for every pet" do
      mike = Shelter.create(name: "Mike's Shelter",
               address: "1331 17th Street",
               city: 'Denver',
               state: 'CO',
               zip: '80202')

      meg = Shelter.create(name: "Meg's Shelter",
                    address: "150 Main Street",
                    city: 'Hershey',
                    state: 'PA',
                    zip: '17033')

      pet_1 = Pet.create(name: "Athena",
                age: "1",
                sex: "F",
                description: 'butthead',
                image: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg',
                status: "available",
                shelter_id: mike.id)

      pet_2 = Pet.create(name: "Odell",
                age: "4",
                sex: "M",
                description: 'good dog',
                image: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg',
                status: "available",
                shelter_id: meg.id)

      visit '/pets'

      expect(page).to have_button("Delete Pet", count: Pet.all.count)

      click_on("Delete Pet", id: "#{pet_2.name}-delete")

      expect(current_path).to eq("/pets")
      expect(page).to_not have_content("Odell")
    end
  end
end