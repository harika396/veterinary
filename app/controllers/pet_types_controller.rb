class PetTypesController < ApplicationController
  before_action :check_role, :only => [:edit, :delete]

  def index
    @pet_types = PetType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pet_types }
    end
  end


  def show
    @pet_type = PetType.where(:id => params[:id]).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pet_type }
    end
  end


  def new
    @pet_type = PetType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pet_type }
    end
  end


  def edit
    @pet_type = PetType.where(:id => params[:id]).first
  end


  def create
    @pet_type = PetType.new(pet_params)

    respond_to do |format|
      if @pet_type.save
        format.html { redirect_to @pet_type, notice: 'Pet type was successfully created.' }
        format.json { render json: @pet_type, status: :created, location: @pet_type }
      else
        format.html { render action: "new" }
        format.json { render json: @pet_type.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @pet_type = PetType.where(:id => params[:id]).first

    respond_to do |format|
      if @pet_type.update_attributes(pet_params)
        format.html { redirect_to @pet_type, notice: 'Pet type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pet_type.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @pet_type = PetType.where(:id => params[:id]).first
    @pet_type.destroy

    respond_to do |format|
      format.html { redirect_to pet_types_url }
      format.json { head :no_content }
    end
  end

  private
  def pet_params
    params.require(:pet_type).permit(:name)
  end

  def check_role
    if current_user.customer?
      redirect_to root_url
    end
  end
end
