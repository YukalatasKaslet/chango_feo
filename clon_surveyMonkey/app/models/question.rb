class Question < ActiveRecord::Base
  # Remember to create a migration!
  #Asociaciones
  belongs_to :survey
  has_many   :options, dependent: :destroy

end
