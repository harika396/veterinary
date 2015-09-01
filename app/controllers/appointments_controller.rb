class AppointmentsController < ApplicationController
  
  def index
    if current_user.customer?
      @appointments = current_user.appointments
    else
      @appointments = Appointment.all
    end

    @user_hash = Hash.new
    @pet_hash = Hash.new
    @doctor_hash = Hash.new
    @appointments.each do |a|
      @user_hash["#{a.id}"] = User.select('name').where(:id => a.user_id).first
      @pet_hash["#{a.id}"] = Pet.where(:id => a.pet_id).first
      @doctor_hash["#{a.id}"] = User.where(:id => a.doctor_id).first
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appointments }
    end
  end

  def show
    binding.pry
    if current_user.customer?
      @appointment = current_user.appointments.find(params[:id])
    else
      @appointment = Appointment.find(params[:id])
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment }
    end
  end

  def new
    @appointment = Appointment.new
    @doctors = User.doctors
    @user = @appointment.build_user
    @pet = @user.build_pet

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointment }
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @doctors = User.doctors
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @doctors = User.doctors
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render json: @appointment, status: :created, location: @appointment }
      else
        format.html { render action: "new" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    @appointment = Appointment.where(:id => params[:id]).first

    respond_to do |format|
      if @appointment.update_attributes(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @appointment = Appointment.where(:id => params[:id]).first
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end
end

private
 def appointment_params
  params.require(:appointment).permit(:date_of_visit, :doctor_id, :reminder, :pet_id, :reason, :user_id, user_attributes: [:name, :email, :password, :password_confirmation, pet_attributes: [:name, :user_id, :doctor_id]])
 end