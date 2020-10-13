class Question < ApplicationRecord
  belongs_to :user, optional: true
  has_many :question_categories, dependent: :destroy
  has_many :categories, through: :question_categories

  def save_category(sent_categories)
    current_categories = self.categories.pluck(:category_id) unless self.categories.nil?
    old_categories = current_categories - sent_categories
    new_categories = sent_categories - current_categories

    old_categories.each do |old|
      self.question_categories.delete QuestionCategory.find_by(category_id: old)
    end

    new_categories.each do |new|
      new_question_category = QuestionCategory.find_or_create_by(category_id: new)
      self.question_categories << new_question_category
    end
  end
end
