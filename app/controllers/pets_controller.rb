class PetsController < ApplicationController
	before_action :set_pet, only: [:show, :edit, :update, :destroy]
	
	def new
		@pet = Pet.new
	end

	def create
		# binding.pry
		@pet = Pet.new(pet_params)
		if @pet.save
			flash[:success] = "Your pet has been saved successfully!"
			redirect_to pet_path(@pet)
		else
			flash[:danger] = "Your pet failed to save"
			render "new"
		end
	end

	def show
	end

	def index
		if params[:search]
	  	@pets = Pet.search(params[:search])
	  	elsif @pets = if params[:user_id]
      	user = User.find(params[:user_id])
      	user.pets.page(params[:page]).per_page(5)
      else
    		@pets = Pet.paginate(page: params[:page], per_page: 15)
    	end
    else
   		@pets = Pet.all
   	end	
  end



	def edit
	end

	def update
		if @pet.update(pet_params)
			flash[:success] = "Your pet was successfully edited"
			redirect_to pet_path
		else
			flash[:danger] = "Your pet has not been updated"
			render "edit"
		end
	end

	def destroy
		@pet.delete
		redirect_to pets_path
	end

	private

	def set_pet
		@pet = Pet.find_by(id: params[:id])
	end


	def pet_params
		params.require(:pet).permit(:name, :species, :breed, :user_id)
	end


end