class Question < ApplicationRecord
  belongs_to :user, optional: true
  has_many :question_categories, dependent: :destroy
  has_many :categories, through: :question_categories
  has_many :comments, dependent: :destroy
  validates :title, :content, presence: true

  accepts_nested_attributes_for :categories, allow_destroy: true
end
