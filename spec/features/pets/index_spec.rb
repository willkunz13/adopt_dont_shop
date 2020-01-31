require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
	it "can see all pets image, name, approx age, sex, and shelter name" do
		shelter_1 = Shelter.create(name: "helter_shelter",\
address: "nowhere", city: "Detroit", state: "MI", zip: "313")
		pet_1 = Pet.create(image: "/assets/images/dog_test.jpg", approximate_age: 3, \
sex: "F", description: "big", adopt_status: "not",  shelter: shelter_1)
		pet_2 = Pet.create(name: "tiny", image: "/assets/images/tiger_test.jpg", approximate_age: 7, sex: "M", \
description: "small", adopt_status: "not", shelter: shelter_1)

		visit "/pets"

		expect(page).to have_content(pet_1.name)
		expect(page).to have_content(pet_2.name)
	end
end
