class Question < ApplicationRecord
  belongs_to :user, optional: true
  has_many :question_categories, dependent: :destroy
  has_many :categories, through: :question_categories
  validates :title, :content, presence: true

  accepts_nested_attributes_for :categories, allow_destroy: true
end
