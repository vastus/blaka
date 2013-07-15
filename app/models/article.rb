class Article < ActiveRecord::Base
  # attrs
  attr_accessible :extended, :intro, :title, :category_id, :user_id

  # relationships
  belongs_to :category
  belongs_to :author, foreign_key: :user_id, class_name: 'User'

  # validations
  validates_presence_of :title, :intro, :extended, :category_id, :user_id
  validates_uniqueness_of :title
end

