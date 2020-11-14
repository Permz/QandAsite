require "rails_helper"

RSpec.describe "UserAuthentications", type: :request do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, name: "") }

  describe "POST #create" do
    before do
      ActionMailer::Base.deliveries.clear
    end

    context "パラメータが妥当な場合" do
      it "リクエストが成功する" do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 302
      end

      # it '認証メールが送信されること' do
      #   post user_registration_path, params: { user: user_params }
      #   expect(ActionMailer::Base.deliveries.size).to eq 1
      # end

      it "createが成功する" do
        expect do
          post user_registration_path, params: { user: user_params }
        end.to change { User.count }.by 1
      end

      it "リダイレクトされる" do
        post user_registration_path, params: { user: user_params }
        expect(response).to redirect_to root_url
      end
    end

    context "パラメータが不正な場合" do
      it "リクエストが成功する" do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.status).to eq 200
      end

      # it '認証メールが送信されないこと' do
      #   post user_registration_path, params: { user: invalid_user_params }
      #   expect(ActionMailer::Base.deliveries.size).to eq 0
      # end

      it "createが失敗する" do
        expect do
          post user_registration_path, params: { user: invalid_user_params }
        end.not_to change { User.count }
      end

      it "エラーが表示される" do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.body).to include "エラーが発生したため ユーザ は保存されませんでした。"
      end
    end
  end
end
