class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  # Update last_login_time after a user logs in
  def after_database_authentication
    self.last_login_time = Time.current
    save(validate: false) # Skip validations to ensure the record is saved even if other fields are not valid
  end
end
