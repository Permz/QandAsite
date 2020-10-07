class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :introduction, presence: false, length: { maximum: 100 } #100文字制限

  mount_uploader :image, ImageUploader
end
