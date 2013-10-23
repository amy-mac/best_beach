class BeachesController < ApplicationController
  COORDS = []
  
  def index

  end
  
  def create
    @latitude = params[:latitude]
    @longitude = params[:longitude]
    
    COORDS << @latitude
    COORDS << @longitude
    
    y = Information.new
    @response = y.get_beach_list(@latitude, @longitude)
    
    @origin = @latitude + "," + @longitude
  end
  
  def show
    @beach = Beach.find_by_yelp_id(params[:id])
    
    y = Information.new
    @response = y.get_beach(@beach.yelp_id)
    
    # @origin = COORDS[0] + "," + COORDS[1]
    @origin = "37.7798776,-122.3949111"
    @destination = []
    @destination << @response['location']['address'][0].split(" ")
    @destination << @response['location']['postal_code']
    @destination = @destination.flatten.join(",")

    @directions = Typhoeus.get(
      "http://maps.googleapis.com/maps/api/directions/json?origin=#{@origin}&destination=#{@destination}&sensor=false"
      )
      
    @results = JSON.parse(@directions.body)

    w = Wunderground.new('5d5c82de5f22fc4e')
    @weather = w.conditions_and_hourly_and_tide_for(@response['location']['postal_code'])
    
    # client = Wikipedia::Client.new
    # @wiki_page = client.find( @beach.name )
  end

end