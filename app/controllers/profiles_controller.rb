class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to edit_profile_path(@user), notice: 'Profile was successfully updated.'
    else
      flash[:alert] = @user.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role, :image, :description, :phone, subject_list: [])
  end
end
