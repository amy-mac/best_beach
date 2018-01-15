module BeachesHelper

  def origin_set
    JSON.parse(cookies.encrypted[:coordinates]).join(",")
  end

  def weather(postal_code)
    w = Wunderground.new(ENV["WUNDERGROUND_TOKEN"])
    sleep(0.5)
    @weather = w.forecast_and_conditions_and_astronomy_for(postal_code)
    return @weather
  end
  
  # Need to refactor this
  def get_destination(address, zip)
    destination = []
    if address && zip
      unless address.empty?
        destination << address.split(" ")
        destination << zip
        destination = destination.flatten.join(",")
        if destination.include? "&"
          return destination.gsub!("&", "and")
        else
          return destination
        end
      end
    elsif zip
      destination << zip
      destination = destination.flatten.join
      if destination.include? "&"
        return destination.gsub!("&", "and")
      else
        return destination
      end
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
