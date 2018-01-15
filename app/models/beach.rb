class Beach < ActiveRecord::Base
  validates :name, :presence => true
  validates :yelp_id, :uniqueness => true
end
