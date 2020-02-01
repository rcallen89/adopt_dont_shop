require 'rails_helper'

RSpec.describe 'pet index page all', type: :feature do
  context 'as a user' do
    it 'can see all pets in system' do
      mike = create(:shelter)
      meg = create(:shelter, name: "Meg's Shelter")
      pet_1 = create(:pet, shelter: mike)
      pet_2 = create(:pet, name: "Odell", shelter: meg)

      visit '/pets'


      expect(page).to have_css("img[src*='#{pet_2.image}']")
      expect(page).to have_content("Odell")
      expect(page).to have_content("1")
      expect(page).to have_content("F")
      expect(page).to have_content("#{meg.name}")
    end
  end
end

RSpec.describe "Pet Index Page Update", type: :feature do
  context "as a user" do
    it "can see a update button for each pet" do
      mike = create(:shelter)
      meg = create(:shelter, name: "Meg's Shelter")
      pet_1 = create(:pet, shelter: mike)
      pet_2 = create(:pet, name: "Odell", shelter: meg)

      visit '/pets'

      expect(page).to have_button("Update Pet", count: Pet.all.count)

      click_on("Update Pet", id: pet_2.name)

      expect(current_path).to eq("/pets/#{pet_2.id}/edit")
      expect(page).to have_content("Odell")
    end

    it "can see a delete button for every pet" do
      mike = create(:shelter)
      meg = create(:shelter, name: "Meg's Shelter")
      pet_1 = create(:pet, shelter: mike)
      pet_2 = create(:pet, name: "Odell", shelter: meg)

      visit '/pets'

      expect(page).to have_button("Delete Pet", count: Pet.all.count)

      click_on("Delete Pet", id: "#{pet_2.name}-delete")

      expect(current_path).to eq("/pets")
      expect(page).to_not have_content("Odell")
    end
  end
end