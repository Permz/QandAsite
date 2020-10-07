class UsersController < ApplicationController
  def show
    @user = current_user
  end
  
  protected

  def user_params
    params.require(:user).permit(:image)
  end
end
