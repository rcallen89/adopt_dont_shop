require 'rails_helper'

RSpec.describe 'Pet Show Page', type: :feature do
  context 'as a visitor' do
    it "can show pet info" do
      mike = create(:shelter)
      meg = create(:shelter, name: "Meg's Shelter")
      pet_1 = create(:pet, shelter: mike)
      pet_2 = create(:pet, name: "Odell", shelter: meg)

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
      mike = create(:shelter)
      meg = create(:shelter, name: "Meg's Shelter")
      pet_1 = create(:pet, shelter: mike)
      pet_2 = create(:pet, name: "Odell", shelter: meg)

      visit "/pets/#{pet_1.id}"

      click_on "Delete Pet"

      expect(current_path).to eq('/pets')
      expect(page).to_not have_content("Athena")
    end
  end
end