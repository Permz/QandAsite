class Question < ApplicationRecord
  belongs_to :users, optional: true
end
