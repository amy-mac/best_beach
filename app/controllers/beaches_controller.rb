class BeachesController < ApplicationController
  
  def index

  end
  
  def create
    @latitude = params[:latitude]
    @longitude = params[:longitude]

    cookies[:coordinates] = [@latitude, @longitude]
    # binding.pry
    
    yelp_call = Information.new
    @response = yelp_call.get_beach_list(@latitude, @longitude)
    
    @origin = origin_set

  end
  
  def show
    @beach = Beach.find_by_yelp_id(params[:id])
    
    yelp_call = Information.new
    @response = yelp_call.get_beach(@beach.yelp_id)
    
    origin = origin_set

    destination = get_destination(@response['location']['address'][0], @response['location']['postal_code'])

    @drive_time = mapquest_api(origin, destination)

    @directions = "https://maps.google.com/maps?saddr=#{origin}&daddr=#{destination}"

  end

end