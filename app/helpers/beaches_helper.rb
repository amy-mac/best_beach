module BeachesHelper

  def origin_set
    if cookies[:coordinates].is_a? Array
      origin = cookies[:coordinates][0] + "," + cookies[:coordinates][1]
    else
      origin = cookies[:coordinates].split("&")
      origin = origin[0] + "," + origin[1]
    end
    return origin
  end

  def weather(postal_code)
    w = Wunderground.new('5d5c82de5f22fc4e')
    sleep(0.5)
    @weather = w.forecast_and_conditions_and_astronomy_for(postal_code)
    return @weather
  end
  
  def get_destination(address, zip)
    destination = []
    if address && zip
      unless address.empty?
        destination << address.split(" ")
        destination << zip
        return destination.flatten.join(",")
      end
    elsif zip
      destination << zip
      return destination.flatten.join
    end
  end

  def mapquest_api(origin, dest)
    directions = Typhoeus.get(
      "http://www.mapquestapi.com/directions/v2/route?key=Fmjtd%7Cluubnu0all%2C7n%3Do5-9u1s0z&from=#{origin}&to=#{dest}"
      )

    @results = JSON.parse(directions.body)
    return @results
  end

  def photos_link(location, city)
    link = "http://www.flickr.com/search/?q=#{location + " " + city}&ss=1&ct=0&mt=all&w=all&adv=1"
    return link
  end
end