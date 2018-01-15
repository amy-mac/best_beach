class BeachesController < ApplicationController

  def index

  end

  def create
    @latitude = params[:latitude]
    @longitude = params[:longitude]

    cookies[:coordinates] = [@latitude, @longitude]

    yelp_call = Information.new
    @response = yelp_call.get_beach_list(@latitude, @longitude)

    @origin = origin_set

  end

  def show
    @beach = Beach.find_by_yelp_id(params[:id])

    yelp_call = Information.new
    @yelp_response = yelp_call.get_beach(@beach.yelp_id)
    @zip = @yelp_response['location']['postal_code']

    origin = origin_set

    destination = get_destination(@yelp_response['location']['address'][0], @zip)

    #@drive_time = mapquest_api(origin, destination)
    @drive_time = nil

    @directions = "https://maps.google.com/maps?saddr=#{origin}&daddr=#{destination}"

  end

end
