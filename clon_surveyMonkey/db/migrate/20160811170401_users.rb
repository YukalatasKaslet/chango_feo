class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :name
      t.string    :email
      #has_secure_password
      #Adds methods to set and authenticate against a BCrypt password.
      #This mechanism requires you to hace a << password_digest >> attribute
      t.string    :password_digest, nul: false 
    end

    create_table :surveys do |t|
      t.belongs_to :user#se crea la llave foránea user_id
      t.string     :name
      t.timestamp
    end

    create_table :questions do |t|
      t.belongs_to :survey#se crea la llave foránea survey_id
      t.string     :body, null: false
      t.timestamp
    end

    create_table :choices do |t|
      t.belongs_to :question#se crea la llave foránea question_id
      t.belongs_to :answer  #se crea la llave foránea answer_id
      t.boolean    :check, default: false
      t.timestamp
    end

    create_table :answers do |t|
      t.belongs_to :question, index: true #se crea la llave foránea question_id
      t.string     :body, null: false
      t.timestamp
    end    
  end
end
