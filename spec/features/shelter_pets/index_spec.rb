require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
        it "can see all pets for a shelter" do
                shelter_1 = Shelter.create(name: "helter_shelter",\
address: "nowhere", city: "Detroit", state: "MI", zip: "313")
                pet_1 = Pet.create(name: "dog", image: "/assets/images/dog_test.jpg", \
approximate_age: 3, sex: "F", description: "big",  shelter: shelter_1)
                pet_2 = Pet.create(name: "tiny", image: "/assets/images/tiger_test.jpg", \
approximate_age: 7, sex: "M", description: "small", adopt_status: false, shelter: shelter_1)

                visit "/shelters/#{shelter_1.id}/pets"

                expect(page).to have_content(pet_1.name)
                expect(page).to have_content(pet_1.approximate_age)
                expect(page).to have_content(pet_1.sex)
                expect(page).to have_content(pet_2.name)
                expect(page).to have_content(pet_2.approximate_age)
                expect(page).to have_content(pet_2.sex)
        end
end
