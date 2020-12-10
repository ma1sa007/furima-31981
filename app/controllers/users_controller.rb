class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end

  private

  def user_params
    params.require(:user).permit()
  end
end
