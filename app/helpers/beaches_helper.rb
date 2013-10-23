module BeachesHelper
  
  def weather(postal_code)
    w = Wunderground.new('5d5c82de5f22fc4e')
    @weather = w.conditions_and_astronomy_and_hourly_for(postal_code)
    return @weather
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

  def mapquest_api(origin, dest)
    directions = Typhoeus.get(
      "http://www.mapquestapi.com/directions/v2/route?key=Fmjtd%7Cluubnu0all%2C7n%3Do5-9u1s0z&from=#{origin}&to=#{dest}"
      )

    @results = JSON.parse(directions.body)
    return @results
  end
end