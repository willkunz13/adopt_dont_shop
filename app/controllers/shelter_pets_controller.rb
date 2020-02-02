class ShelterPetsController < ApplicationController

	def index
		@shelter = Shelter.find(params[:shelter_id])
	end

	def new
	end

	def create
		pet = Pet.create!(pet_params)
		redirect_to "/shelters/#{pet_params[:shelter_id]}/pets"
		
	end

	private
	def pet_params
		params.permit( :name, :image, :description, :approximate_age,\
			:sex, :shelter_id)
	end
end
