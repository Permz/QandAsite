class Question < ApplicationRecord
  belongs_to :user
  has_many :question_categories, dependent: :destroy
  has_many :categories, through: :question_categories
  has_many :comments, dependent: :destroy
  validates :title, :content, presence: true, uniqueness: { case_sensitive: true }
  validates :title, length: { minimum: 4, maximum: 25 }
  validates :content, length: { minimum: 5, maximum: 500 }

  accepts_nested_attributes_for :categories, allow_destroy: true
end
