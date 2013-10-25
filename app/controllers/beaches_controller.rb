class BeachesController < ApplicationController
  
  def index

  end
  
  def create
    @latitude = params[:latitude]
    @longitude = params[:longitude]

    cookies[:coordinates] = [@latitude, @longitude]
    
    y = Information.new
    @response = y.get_beach_list(@latitude, @longitude)
    
    @origin = origin_set

  end
  
  def show
    @beach = Beach.find_by_yelp_id(params[:id])
    
    y = Information.new
    @response = y.get_beach(@beach.yelp_id)
    
    @origin = origin_set
    @destination = []
    @destination << @response['location']['address'][0].split(" ")
    @destination << @response['location']['postal_code']
    @destination = @destination.flatten.join(",")

    @drive_time = Typhoeus.get(
      "http://www.mapquestapi.com/directions/v2/route?key=Fmjtd%7Cluubnu0all%2C7n%3Do5-9u1s0z&from=#{@origin}&to=#{@destination}"
      )
    @results = JSON.parse(@drive_time.body)


    @directions = "https://maps.google.com/maps?saddr=#{@origin}&daddr=#{@destination}"

    w = Wunderground.new('5d5c82de5f22fc4e')
    @weather = w.forecast_and_conditions_and_astronomy_for(@response['location']['postal_code'])
    
  end

end