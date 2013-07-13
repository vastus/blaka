require 'bcrypt'

class User < ActiveRecord::Base
  # attrs
  attr_accessible :name, :email, :password_hash, :password_salt

  # virtual attrs
  attr_accessor :password

  # callbacks
  before_save :generate_password

  # validations
  validates_presence_of :name, :email
  validates_presence_of :password, on: :create
  validates_confirmation_of :password
  # validates_length_of :password

  private
  def generate_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end

