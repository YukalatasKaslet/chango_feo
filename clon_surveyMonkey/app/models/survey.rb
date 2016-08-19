class Survey < ActiveRecord::Base
  # Remember to create a migration!
  #Asociaciones
  belongs_to  :user
  has_many    :questions, :dependent => :destroy
  has_many    :completed_surveys
end
