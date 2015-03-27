class Patron < ActiveRecord::Base
  # Necessary for bcrypt built-in Rails methods to work
  has_secure_password
  
  attr_accessible :first_name, :last_name, :username, :password, :password_confirmation, :email
  
  has_and_belongs_to_many :events
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true
end