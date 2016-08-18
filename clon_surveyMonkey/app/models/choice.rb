class Choice < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  belongs_to :answer, dependent: :destroy
end
