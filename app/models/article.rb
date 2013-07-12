class Article < ActiveRecord::Base
  # attrs
  attr_accessible :extended, :intro, :title

  # relationships
  belongs_to :category

  # validations
  validates_presence_of :title, :intro, :extended, :category_id
  validates_uniqueness_of :title
end
