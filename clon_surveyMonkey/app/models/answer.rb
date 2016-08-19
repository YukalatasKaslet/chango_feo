class Answer < ActiveRecord::Base
  # Remember to create a migration!
  #Asociaciones
  belongs_to  :options
  belongs_to  :taker, class_name: "User", foreign_key: "user_id"
end
