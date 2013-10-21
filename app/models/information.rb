class Information
  attr_accessor :get_beach_list, :insert_beaches_into_db, :response
  
  def initialize
    @client = Yelp::Client.new
    @response = []
  end
  
  def get_beach_list(lat, long)
    request = Yelp::V2::Search::Request::GeoPoint.new(
              :latitude => lat,
              :longitude => long,
              :category_filter => ['beaches'],
              :radius_filter => 40000,
              :sort => 2)
    @response = @client.search(request)['businesses']
  end

  def insert_beaches_into_db
    @response.each do |beach|
      if Beach.find_by_yelp_id("#{beach}").nil?
        Beach.create(name: "#{beach['name']}", yelp_id: "#{beach['id']}")
      end
    end
  
  end

end