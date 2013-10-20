require 'spec_helper'

describe Beach do
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:main_image) }
end
