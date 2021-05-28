class AppointmentsController < ApplicationController
  before_action :set_user
  before_action :set_appointment, only: %i(show update)

  def index
    @pagy, @appointments = pagy(@user.received_appointments)
  end

  def show
    gon.push({
      appointment_url: user_appointment_path
    })
  end

  def update
    @appointment.update(status: params['status'])

    respond_to do |format|
      format.js
      format.json { render status: :created }
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def set_appointment
    @appointment = @user.received_appointments.find_by(id: params[:id])
  end
end
