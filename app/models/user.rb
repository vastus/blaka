class User < ActiveRecord::Base
  # attrs
  attr_accessible :name, :email, :password_hash, :password_salt

  # virtual attrs
  attr_accessor :password

  # validations
  validates_presence_of :name, :email
  validates_presence_of :password, on: :create
  validates_confirmation_of :password
end

