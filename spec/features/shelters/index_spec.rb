require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
	before(:each) do
		@shelter_1 = Shelter.create(name: "helter_shelter",\
address: "nowhere", city: "Detroit", state: "MI", zip: "313")
		@shelter_2 = Shelter.create(name: "shelter B",\
address: "somewhere", city: "Boise", state: "ID", zip: "404")
		visit "/shelters"
	end

	it "can see all shelter names, addresses, cities, states, and zips" do
		expect(page).to have_content(@shelter_1.name)
		expect(page).to have_content(@shelter_2.name)
	end

	it "can access pet edit from here" do
		within ".shelter-#{@shelter_1.id}" do
			click_on "Edit"
		end
		
		expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")

	end

	it "can delete shelter" do	
		expect(page).to have_content(@shelter_1.name)
		within ".shelter-#{@shelter_1.id}" do
                	click_on "Delete"
                end	 
		expect(page).to_not have_content(@shelter_1.name)
        end	
end
