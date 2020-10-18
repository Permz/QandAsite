class Comment < ApplicationRecord
  belongs_to :question
  belongs_to :user
  
  validates :content, presence: true, uniqueness: true
  validates :content, length: { minimum: 10, maximum: 500 }
end
