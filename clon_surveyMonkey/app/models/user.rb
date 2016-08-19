class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  #Asociaciones
  has_many  :surveys
  has_many  :answers

  has_many  :completed_surveys
  has_many  :taken_survey, through: :completed_surveys, source: :survey

  has_many  :options, through: :answers
  

  #Validaciones
  validates :name, :password, presence: true
  validates :email, presence: true, uniqueness: true

  #se está usando en self.authenticate *user.password*
  def password
    @password ||= Password.new(password_digest)
  end

  #se usa al momento de crear o modificar la contraseña
  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  def self.authenticate(email, user_password)
    user = User.find_by(email: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end
  end

end
