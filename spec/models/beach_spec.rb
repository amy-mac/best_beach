require 'spec_helper'

describe Beach do
  
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:yelp_id) }

end
