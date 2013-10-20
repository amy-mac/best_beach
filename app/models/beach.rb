class Beach < ActiveRecord::Base
  attr_accessible :name, :description, :main_image, :yelp_id
end
