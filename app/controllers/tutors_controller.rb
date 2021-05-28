class TutorsController < ApplicationController
  before_action :set_user, only: %i[show]

  def index
    query = params[:query]

    users =
      if query.present?
        User.tutor.tagged_with(params[:query]).order(:created_at)
      else
        User.tutor.order(:created_at)
      end

    @pagy, @users = pagy(users)
  end

  def appointment
    appointment = Appointment.find_or_create_by(applicant_id: params['userId'], respondent_id: params['tutorId'], status: 'pending')

    respond_to do |format|
      format.js
      format.json { render status: :created }
    end
  end

  def show
    gon.push({
      user_id: current_user.id,
      tutor_id: @user.id,
      appointment_url: appointment_tutor_path
    })

    @pagy, @comments = pagy(@user.comments)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
