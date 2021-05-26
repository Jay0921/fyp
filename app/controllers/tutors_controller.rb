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

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
