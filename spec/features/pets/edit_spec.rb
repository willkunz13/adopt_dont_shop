require 'rails_helper'

RSpec.describe "visitor can edit pet in shelter", type: :feature do
        it "can edit pet in shelter" do
                shelter_1 = Shelter.create(name: "helter_shelter",\
address: "nowhere", city: "Detroit", state: "MI", zip: "313")
                pet_1 = Pet.create(name: "dog", image: "/assets/dog_test.jpg", \
approximate_age: 3, sex: "F", description: "big", shelter: shelter_1)
                pet_2 = Pet.create(name: "tiny", image: "/assets/tiger_test.jpg", \
approximate_age: 7, sex: "M", description: "small", shelter: shelter_1)
                visit "pets/#{pet_1.id}"

                click_link "Update Pet"

                expect(current_path).to eq("/pets/#{pet_1.id}/edit")

                fill_in "Name", with: "Turner"
                fill_in "Image", with: "https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg"
                fill_in "Description", with: "white male"
                fill_in "approximate_age", with: 35
                fill_in "Sex", with: "M"
                click_button "Update Pet"

		expect(current_path).to eq("/pets/#{pet_1.id}")

                expect(page).to have_content("Turner")
        end
end

