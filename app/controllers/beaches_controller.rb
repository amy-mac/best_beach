class BeachesController < ApplicationController
  
  def index
    client = Yelp::Client.new
 
    request = Yelp::V1::Review::Request::Location.new(
                :address => '650 Mission St',
                :city => 'San Francisco',
                :state => 'CA',
                :radius => 2,
                :term => 'cream puffs')
    @response = client.search(request)['businesses']
  end
end
