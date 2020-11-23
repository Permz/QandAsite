require 'rails_helper'

RSpec.describe Question, type: :model do
  before do 
    @user = build(:user)
    @question = build(:question)
  end

  describe 'validation' do
    # 投稿者、タイトル、内容があれば有効
    it "is valid with a title and content" do
      expect(@question).to be_valid
    end
    # タイトルがなければ無効
    it "is invalid without a title" do
      @question = Question.new(title: "nil")
      expect(@question).to be_invalid
    end
    # 内容がなければ無効
    it "is invalid without an email address" do
      @question = Question.new(content: "nil")
      expect(@question).to be_invalid
    end
    # 投稿者がなければ無効
    it "is invalid without a user" do
      @question = Question.new(user_id: nil)
      expect(@question).to be_invalid
    end
  end
end
