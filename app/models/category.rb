class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 10 }
  validates_uniqueness_of :name
  has_many :question_categories, dependent: :destroy
  has_many :questions, through: :question_categories
end