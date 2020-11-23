require 'rails_helper'

RSpec.describe News, type: :model do
  before do
    @news = build(:news)
  end

  describe 'validation' do
    # 投稿者、タイトル、内容があれば有効
    it "is valid with a title and content" do
      expect(@news).to be_valid
    end
    # 


  end
end