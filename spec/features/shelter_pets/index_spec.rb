require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
	before(:each) do
                @shelter_1 = Shelter.create(name: "helter_shelter",\
address: "nowhere", city: "Detroit", state: "MI", zip: "313")
                @pet_1 = Pet.create(name: "dog", image: "/assets/images/dog_test.jpg", \
approximate_age: 3, sex: "F", description: "big",  shelter: @shelter_1)
                @pet_2 = Pet.create(name: "tiny", image: "/assets/images/tiger_test.jpg", \
approximate_age: 7, sex: "M", description: "small", adopt_status: false, shelter: @shelter_1)

                visit "/shelters/#{@shelter_1.id}/pets"
	end

        it "can see all pets for a shelter" do

                expect(page).to have_content(@pet_1.name)
                expect(page).to have_content(@pet_1.approximate_age)
                expect(page).to have_content(@pet_1.sex)
                expect(page).to have_content(@pet_2.name)
                expect(page).to have_content(@pet_2.approximate_age)
                expect(page).to have_content(@pet_2.sex)
        end
	
	it "can edit any pet" do
		within ".pet-#{@pet_1.id}" do
                        click_on "Edit"
                end
		expect(current_path).to eq("/pets/#{@pet_1.id}/edit")
	end

	it "can delete any pet" do
                within ".pet-#{@pet_1.id}" do
                        click_on "Delete"
                end
                expect(page).to_not have_content(@pet_1.name)
        end

	it "can link to all pets" do
                within ".pet-#{@pet_2.id}" do
                        click_on "#{@pet_2.name}"
                end

                expect(current_path).to eq("/pets/#{@pet_2.id}")
        end
end
