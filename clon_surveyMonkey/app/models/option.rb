class Option < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to  :question
  has_many    :answer
  has_many    :takers, through: :answers, source: :user
end
