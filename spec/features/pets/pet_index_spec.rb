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
                approximate_age: "1 year old",
                sex: "F",
                description: 'butthead',
                image: 'https://www.shutterstock.com/image-photo/beagle-running-over-green-meadow-1563583912',
                status: "available",
                shelter_id: mike.id)

      pet_2 = Pet.create(name: "Odell",
                approximate_age: "4 year old",
                sex: "M",
                description: 'good dog',
                image: 'https://www.shutterstock.com/image-photo/beagle-running-over-green-meadow-1563583912',
                status: "available",
                shelter_id: meg.id)

      visit '/pets'


      expect(page).to have_css("img[src*=#{pet_2.image}]")
      expect(page).to have_content("Odell")
      expect(page).to have_content("4 year old")
      expect(page).to have_content("M")
      expect(page).to have_content("meg.name")
    end
  end
end