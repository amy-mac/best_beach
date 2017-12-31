require 'spec_helper'

describe Weather, type: :model do
  it "initializes a new Wunderground object" do
    expect(Weather.new.client).to be_an_instance_of(Wunderground)
  end
end
