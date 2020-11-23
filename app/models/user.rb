class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :introduction, presence: false, length: { maximum: 255 }

  mount_uploader :image, ImageUploader

  has_many :questions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :news, dependent: :destroy

  def self.guest
    find_or_create_by(email: 'guest@example.com') do |user|
      user.name = 'ゲストユーザー'
      user.password = SecureRandom.urlsafe_base64
      user.admin_flg = false
    end
  end
end
