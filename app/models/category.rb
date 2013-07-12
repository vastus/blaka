class Category < ActiveRecord::Base
  # attributes
  attr_accessible :name

  # relationships
  has_many :articles
end
