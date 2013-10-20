module BeachesHelper
  
  def weather(postal_code)
    client = YahooWeather::Client.new
    response = client.fetch_by_location("#{postal_code}")
    return "#{response.condition.temp} #{response.units.temperature}"
  end
end
