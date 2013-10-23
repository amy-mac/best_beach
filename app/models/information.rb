class Information
  attr_accessor :get_beach_list, :insert_beaches_into_db, :get_beach, :response1, :response2
  
  def initialize
    @client = Yelp::Client.new
    @response1 = []
    @response2 = {}
  end
  
  def get_beach_list(lat, long)
    request = Yelp::V2::Search::Request::GeoPoint.new(
              :latitude => lat,
              :longitude => long,
              :category_filter => ['beaches'],
              :limit => 9,
              :radius_filter => 40000,
              :sort => 2)
    @response = @client.search(request)['businesses']
    insert_beaches_into_db
  end

  def insert_beaches_into_db
    @response.each do |beach|
      if Beach.find_by_yelp_id("#{beach}").nil?
        Beach.create(name: "#{beach['name']}", yelp_id: "#{beach['id']}")
      end
    end
  
  end

  def get_beach(yelp_id)
    request = Yelp::V2::Business::Request::Id.new(
      :yelp_business_id => yelp_id)
    @response = @client.search(request)
  end
end