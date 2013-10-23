class Weather
  attr_accessor :client

  def initialize
    @client = Wunderground.new('5d5c82de5f22fc4e')
  end

end
