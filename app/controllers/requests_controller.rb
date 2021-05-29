class RequestsController < ApplicationController
  before_action :set_user
  before_action :set_appointment, only: %i(show update)

  def index
    @pagy, @appointments = pagy(@user.sent_appointments)
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
  end
end
