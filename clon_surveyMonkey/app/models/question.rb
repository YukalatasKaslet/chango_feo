class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :survey
  has_many   :choices
  has_many   :answers, through: :choices
end
