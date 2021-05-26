class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  def index
    @pagy, @users = pagy(User.all.order(:created_at))
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      flash[:alert] = @user.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role)
  end
end
