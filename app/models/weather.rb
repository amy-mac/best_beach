class Weather
  attr_accessor :client

  def initialize
    @client = Wunderground.new(ENV["WUNDERGROUND_TOKEN"])
  end

end
