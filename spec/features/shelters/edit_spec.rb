require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
        it "can edit shelter" do
                shelter_1 = Shelter.create(name: "helter_shelter",\
address: "nowhere", city: "Detroit", state: "MI", zip: "313")
                shelter_2 = Shelter.create(name: "shelter B",\
address: "somewhere", city: "Boise", state: "ID", zip: "404")

                visit "/shelters/#{shelter_2.id}"

                expect(page).to have_content(shelter_2.address)
                expect(page).to have_content(shelter_2.city)
                expect(page).to have_content(shelter_2.state)
		click_link "Edit"

		fill_in "shelter[name]", with: "Content"
		click_button "Submit"
		expect(page). to have_content("Content")
        end
end
