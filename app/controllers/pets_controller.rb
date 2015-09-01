class PetsController < ApplicationController
  def index
    @pets = Pet.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pets }
    end
  end

  def show
    @pet = Pet.where(:id => params[:id]).first
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pet }
    end
  end

  def new
    @pet = Pet.new
    @doctors = User.doctors
    @customers = User.customers
    @pet_types = PetType.pet_types
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pet }
    end
  end


  def edit
    @pet = Pet.where(:id => params[:id]).first
    @doctors = User.doctors
    @customers = User.customers
    @pet_types = PetType.pet_types
  end

  def create
    @pet = Pet.new(pet_params)
    @doctors = User.doctors
    @customers = User.customers
    @pet_types = PetType.pet_types

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render json: @pet, status: :created, location: @pet }
      else
        format.html { render action: "new" }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @pet = Pet.where(:id => params[:id]).first
    @doctors = User.doctors
    @customers = User.customers
    @pet_types = PetType.pet_types

    respond_to do |format|
      if @pet.update_attributes(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @pet = Pet.where(:id => params[:id]).first
    @pet.destroy

    respond_to do |format|
      format.html { redirect_to pets_url }
      format.json { head :no_content }
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :breed, :weight, :last_visit, :doctor_id, :user_id, :pet_type_id)
  end
  
 
end
