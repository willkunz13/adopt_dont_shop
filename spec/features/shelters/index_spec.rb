require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
	it "can see all shelter names, addresses, cities, states, and zips" do
		shelter_1 = Shelter.create(name: "helter_shelter",\
address: "nowhere", city: "Detroit", state: "MI", zip: "313")
		shelter_2 = Shelter.create(name: "shelter B",\
address: "somewhere", city: "Boise", state: "ID", zip: "404")

		visit "/shelters"

		expect(page).to have_content(shelter_1.name)
		expect(page).to have_content(shelter_2.name)
	end
end
