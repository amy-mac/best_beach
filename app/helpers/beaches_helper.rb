module BeachesHelper
  
  def weather(postal_code)
    client = YahooWeather::Client.new
    response = client.fetch_by_location("#{postal_code}")
    return "#{response.condition.temp}°#{response.units.temperature}"
  end
  
  def get_destination(address, zip)
    @destination = []
    if address && zip
      @destination << address.split(" ")
      @destination << zip
      return @destination.flatten.join(",")
    elsif zip
      @destination << zip
      return @destination.flatten.join
    end
  end
  
  def google_api(origin, dest)
    directions = Typhoeus.get(
      "http://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{dest}&sensor=false"
      )
      
    @results = JSON.parse(directions.body)
    return @results
  end
end
