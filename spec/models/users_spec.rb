require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = build(:user)
  end

  describe 'validation' do
    # 名前、メール、パスワードがあれば有効
    it "is valid with a name, email, and password" do
      expect(@user).to be_valid
    end
    # 名前がなければ無効
    it "is invalid without a name" do
      @user = User.new(name: "nil")
      expect(@user).to be_invalid
    end
    # メールアドレスがなければ無効
    it "is invalid without an email address" do
      @user = User.new(email: "nil")
      expect(@user).to be_invalid
    end
    # パスワードがなければ無効
    it "is invalid without a password" do
      @user = User.new(password: "nil")
      expect(@user).to be_invalid
    end
    # 重複したメールアドレスなら無効
    it "is invalid with a duplicate email address" do
      @user = User.create(
        name: "yuya",
        email: "mash@example.com",
        password: "password"
      )
      @user = User.new(
        name: "syuuya",
        email: "mash@example.com",
        password: "password"
      )
      @user.valid?
      expect(@user.errors[:email]).to include("はすでに存在します")
    end
    # 重複した名前なら無効
    it "is invalid with a duplicate name" do
      @user = User.create(
        name: "yuya",
        email: "mash@example.com",
        password: "password"
      )
      @user = User.new(
        name: "yuya",
        email: "mashimo@example.com",
        password: "password"
      )
      @user.valid?
      expect(@user.errors[:name]).to include("はすでに存在します")
    end
  end
end