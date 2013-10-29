class Beach < ActiveRecord::Base
  attr_accessible :name, :description, :main_image, :yelp_id

  validates :name, :presence => true
  validates :yelp_id, :uniqueness => true
end
