class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :introduction, presence: false, length: { maximum: 100 } #100文字制限

  mount_uploader :image, ImageUploader

  has_many :questions, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.guest
    find_or_create_by(email: 'guest@example.com') do |user|
      user.name = 'ゲストユーザー'
      user.password = SecureRandom.urlsafe_base64
      user.admin_flg = false
    end
  end
end
