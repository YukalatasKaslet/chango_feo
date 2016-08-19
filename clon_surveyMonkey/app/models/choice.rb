class Choice < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :answer
  #con el método survey_answered pasamos directo a la tabla answers usando la llave foránea.
  has_many :survey_answered, class_name: "Answer", foreign_key: "user_id"
end
