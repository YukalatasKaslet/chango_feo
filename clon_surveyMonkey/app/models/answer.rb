class Answer < ActiveRecord::Base
  # Remember to create a migration!
  has_many  :choices
  has_many  :questions, through: :choices
end
