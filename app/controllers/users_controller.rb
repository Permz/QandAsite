class UsersController < ApplicationController
  def show
    @user = current_user
    add_breadcrumb '会員情報', :users_show_path
  end

  protected

  def user_params
    params.require(:user).permit(:image)
  end
end
