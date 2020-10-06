class UsersController < ApplicationController
before_action :check_account

  def show
    @user = current_user
  end

  private
    def check_account
      #userがログイン中かつ停止フラグが立っている時
      if current_user && current_user.stop_flg?
        #セッションを削除
        session.delete(:user_id)
        flash.alert = "アカウントが無効になりました"
        #トップページへリダイレクト
        redirect_to :root
      end
    end
end
