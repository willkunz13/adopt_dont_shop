require 'rails_helper'
  
RSpec.describe "shelter create page", type: :feature do
        it "can create new shelter" do
	        visit "/shelters/new"
		fill_in "shelter[name]", with: "Shelter C"
		fill_in "shelter[address]", with: "North Ridge"
		fill_in "shelter[city]", with: "Syracuse"
		fill_in "shelter[state]", with: "MA"
		fill_in "shelter[zip]", with: "12345"
		click_button "Create Shelter"		


                expect(page).to have_content("Shelter C")
        end
end

