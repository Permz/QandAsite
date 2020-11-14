class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :name, uniqueness: true
  has_many :question_categories, dependent: :destroy
  has_many :questions, through: :question_categories
end
