class AppointmentsController < ApplicationController
  # GET /appointments
  def index
    appointments = Appointment.order('name DESC')
    render json: {status: 'SUCCESS', message:'Loaded adsda', data:appointments}, status: :ok
  end

  # GET /appointments/:id
  def show
    appointment = Appointment.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded message', data:appointment}, status: :ok
  end

  # POST /appointments
  def create
  	appointment = Appointment.new(appointment_params)

  	if appointment.save
    render json: {status: 'SUCCESS', message:'Loaded message', data:appointment}, status: :ok
    else
    	render json: {status: 'ERROR', message:'Article not saved'}
    end
  end


  # PUT /appointments/:id
  def update
    @appointment.update(appointment_params)
    head :no_content
  end

  # DELETE /appointments/:id
  def destroy
  	appointment = Appointment.find(params[:id])
  	appointment.destroy
    render json: {status: 'SUCCESS', message:'Deleted Message', data:appointment}, status: :ok
  end
  private 
    def appointment_params
      # whitelist params
      params.permit(:name, :from, :to)
    end
    def set_todo
        @appointment = Appointment.find(params[:id])
    end
end
