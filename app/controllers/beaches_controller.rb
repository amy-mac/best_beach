class BeachesController < ApplicationController
  
  def index
    y = Information.new
    @response = y.get_beach_list(37.788022, -122.399797)

  end
  
  def show
    @beach = Beach.find_by_yelp_id(params[:id])
    
    client = Yelp::Client.new
    
    request = Yelp::V2::Business::Request::Id.new(
              :yelp_business_id => @beach.yelp_id)
    @response = client.search(request)
    p @response
    
    # client = Wikipedia::Client.new
    # @wiki_page = client.find( @beach.name )
  end

end