require 'spec_helper'

describe BeachesController do

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'POST create' do
    before :each do
      @params = {latitude: 37.7799177, longitude: -122.39494229999998}
    end

    it 'should create a cookie' do
      post(:create, @params)
      response.cookies['coordinates'].should_not == nil
    end

  end

  describe '#show' do

  end


end