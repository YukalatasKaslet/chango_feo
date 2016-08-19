class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to  :question
  #camino de regreso al usuario usando la llave foránea
  belongs_to :authored_by, class_name: "User", foreign_key: "user_id"
end
