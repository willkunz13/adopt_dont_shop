class PetsController < ApplicationController

	def index
		@pets = Pet.all
	end

	def show
		@pet = Pet.find(params[:id])
	end

	def edit
		@pet = Pet.find(params[:id])
	end

	def update
		pet = Pet.find(params[:id])
		pet.update(pet_params)
		redirect_to "/pets/#{pet.id}"
	end

	def destroy
		Pet.destroy(params[:id])
		redirect_to '/pets'
	end

	private

	def pet_params
		params.permit( :name, :image, :description, \
			:approximate_age, :sex)
	end

end
