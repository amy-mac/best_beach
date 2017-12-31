require 'spec_helper'

describe Beach, type: :model do

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:yelp_id) }

end
