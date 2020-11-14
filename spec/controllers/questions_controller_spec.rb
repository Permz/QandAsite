require "rails_helper"

RSpec.describe QuestionsController, type: :controller do
  describe "#index" do
    it "正常なレスポンスを返す" do
      get :index
      expect(response).to success
    end

    it "200レスポンスが返ってきている" do
      get :index
      expect(response.status).to eq 200
    end
  end
end
