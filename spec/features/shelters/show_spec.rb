require 'rails_helper'
  
RSpec.describe "shelter show page", type: :feature do
        it "can see shelter name, addresse, city, state, and zip" do
                shelter_1 = Shelter.create(name: "helter_shelter",\
address: "nowhere", city: "Detroit", state: "MI", zip: "313")
                shelter_2 = Shelter.create(name: "shelter B",\
address: "somewhere", city: "Boise", state: "ID", zip: "404")

                visit "/shelters/#{shelter_1.id}"

                expect(page).to have_content(shelter_1.name)
                expect(page).to have_content(shelter_1.address)
                expect(page).to have_content(shelter_1.city)
                expect(page).to have_content(shelter_1.zip)

                visit "/shelters/#{shelter_2.id}"

                expect(page).to have_content(shelter_2.name)
                expect(page).to have_content(shelter_2.address)
                expect(page).to have_content(shelter_2.city)
                expect(page).to have_content(shelter_2.state)
        end

	it "can delele a shelter" do
                shelter_1 = Shelter.create(name: "helter_shelter",\
address: "nowhere", city: "Detroit", state: "MI", zip: "313")
                shelter_2 = Shelter.create(name: "shelter B",\
address: "somewhere", city: "Boise", state: "ID", zip: "404")
		
		visit "/shelters/#{shelter_1.id}"
	
		click_button "delete"
		expect(page).to_not have_content(shelter_1.name)
	end

	it "can view its pets" do
                shelter_1 = Shelter.create(name: "helter_shelter",\
address: "nowhere", city: "Detroit", state: "MI", zip: "313")
		pet_1 = Pet.create(name: "test", image: "/assets/images/dog_test.jpg", approximate_age: 3, \
sex: "F", description: "big",  shelter: shelter_1)
		pet_2 = Pet.create(name: "tiny", image: "/assets/images/tiger_test.jpg", approximate_age: 7, sex: "M", \
description: "small", shelter: shelter_1)
		visit "/shelters/#{shelter_1.id}"
	
		click_link "Pets"
		expect(page).to have_content(pet_1.name)
		expect(page).to have_content(pet_2.name)
	end

end

