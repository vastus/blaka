require 'bcrypt'

class User < ActiveRecord::Base
  # attrs
  attr_accessible :name, :email, :password_hash, :password_salt, :password, :role

  # virtual attrs
  attr_accessor :password

  # callbacks
  before_save :generate_password

  # validations
  validates_presence_of :name, :email, :role
  validates_presence_of :password, on: :create
  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates_inclusion_of :role, in: %w( admin author user )
  # validates_length_of :password
  # validates_format_of :email
  
  # relationships
  has_many :articles

  def role?(role)
    self.role == role.to_s
  end

  def self.authenticate(email, pass)
    if user = find_by_email(email)
      pass_match?(user, pass) ? user : false
    else
      false
    end
  end

  private
  def generate_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.pass_match?(user, pass)
    hashed = BCrypt::Engine.hash_secret(pass, user.password_salt)
    hashed == user.password_hash
  end
end

