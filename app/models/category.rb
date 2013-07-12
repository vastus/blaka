class Category < ActiveRecord::Base
  # attributes
  attr_accessible :name

  # validations
  validates_presence_of :name

  # relationships
  has_many :articles
end
