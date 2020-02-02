require 'rails_helper'

RSpec.describe "shelter pet create page", type: :feature do
        it "can create new pet through shelter" do
		shelter_1 = Shelter.create(name: "helter_shelter",\
address: "nowhere", city: "Detroit", state: "MI", zip: "313")
                pet_1 = Pet.create(name: "dog", image: "/assets/dog_test.jpg", \
approximate_age: 3, sex: "F", description: "big", shelter: shelter_1)
                pet_2 = Pet.create(name: "tiny", image: "/assets/tiger_test.jpg", \
approximate_age: 7, sex: "M", description: "small", shelter: shelter_1)
                visit "/shelters/#{shelter_1.id}/pets"

                click_link "Create Pet"

		expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

                fill_in "name", with: "Hooch"
                fill_in "image", with: "https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg"
                fill_in "description", with: "white male"
                fill_in "Approximate age", with: "35"
                fill_in "sex", with: "M"
                click_button "Create Pet"
		expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
	

                expect(page).to have_content("Hooch")
        end
end
