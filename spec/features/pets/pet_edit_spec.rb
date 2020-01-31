require 'rails_helper'

RSpec.describe 'Pet Update Page', type: :feature do
  context 'as a user' do
    it 'can see a form to edit the pet data' do
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

      visit "/pets/#{pet_1.id}/edit"

      fill_in 'name', with: "Edited"
      fill_in 'image', with: "https://image.shutterstock.com/z/stock-photo-adult-miniature-bull-terrier-dog-lying-on-a-fur-rug-on-the-living-room-floor-1573315423.jpg"
      fill_in 'description', with: "Butthead Edited"
      fill_in 'age', with: "2"
      fill_in 'sex', with: "Still Female"

      click_on "Update Pet"
      
      expect(current_path).to eq("/pets/#{pet_1.id}")
      expect(page).to have_content("Edited")
      expect(page).to_not have_content("1")
    end
  end
end