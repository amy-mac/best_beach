class BeachesController < ApplicationController
  
  def index
    client = Yelp::Client.new
    
    request = Yelp::V2::Search::Request::GeoPoint.new(
              :latitude => 37.788022,
              :longitude => -122.399797,
              :category_filter => ['beaches'],
              :radius_filter => 40000,
              :sort => 2)
    @response = client.search(request)['businesses']
    
    @response.each do |beach|
      if Beach.find_by_yelp_id("#{beach}").nil?
        Beach.create(name: "#{beach['name']}", yelp_id: "#{beach['id']}")
      end
    end

  end
  
  def show
    @beach = Beach.find_by_yelp_id(params[:id])
  end

end


# request = Yelp::V2::Search::Request::GeoPoint.new(
#           :latitude => 37.788022,
#           :longitude => -122.399797,
#           :category_filter => ['beaches'],
#           :radius_filter => 40000,
#           :sort => 2)