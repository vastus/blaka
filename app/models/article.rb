class Article < ActiveRecord::Base
  # attrs
  attr_accessible :extended, :intro, :title

  # validations
  validates_presence_of :title, :intro, :extended
  validates_uniqueness_of :title
end
