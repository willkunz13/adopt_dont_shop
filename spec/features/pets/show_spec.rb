require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
	it "can see a pets image name description age sex adopt status" do
		shelter_1 = Shelter.create(name: "helter_shelter", \
address: "nowhere", city: "Detroit", state: "MI", zip: "313")
		pet_1 = Pet.create(name: "dog", image: "/assets/dog_test.jpg", approximate_age: 3, \
sex: "F", description: "big", shelter: shelter_1)
		pet_2 = Pet.create(name: "tiger", image: "/assets/tiger_test.jpg", approximate_age: 7, \
sex: "M", description: "small", shelter: shelter_1)

		visit "/pets/#{pet_1.id}"

		expect(page).to have_content(pet_1.name)
		expect(page).to have_content(pet_1.description)
		expect(page).to have_content(pet_1.adopt_status)
		expect(page).to_not have_content(pet_2.name)
	end

	it "can destroy a pet" do
		shelter_1 = Shelter.create(name: "helter_shelter", \
address: "nowhere", city: "Detroit", state: "MI", zip: "313")
		pet_1 = Pet.create(name: "dog", image: "/assets/dog_test.jpg", approximate_age: 3, \
sex: "F", description: "big", shelter: shelter_1)
		pet_2 = Pet.create(name: "tiger", image: "/assets/tiger_test.jpg", approximate_age: 7, \
sex: "M", description: "small", shelter: shelter_1)

                visit "/pets/#{pet_1.id}"
		
		expect(page).to have_content("dog")
		
		click_button "Delete Pet"

		expect(page).to_not have_content("dog")
	end			
end
