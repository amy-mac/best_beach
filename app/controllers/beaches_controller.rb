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
    @destination = @response['location']['address'][0] + "," + @response['location']['postal_code']

    @drive_time = Typhoeus.get(
      "http://www.mapquestapi.com/directions/v2/route?key=Fmjtd%7Cluubnu0all%2C7n%3Do5-9u1s0z&from=#{@origin}&to=#{@destination}"
      )

    @results = JSON.parse(@drive_time.body)

    @directions = "https://maps.google.com/maps?saddr=#{@origin}&daddr=#{@destination}"

    w = Wunderground.new('5d5c82de5f22fc4e')
    @weather = w.conditions_and_astronomy_and_hourly_for(@response['location']['postal_code'])
    
    # client = Wikipedia::Client.new
    # @wiki_page = client.find( @beach.name )
  end

end