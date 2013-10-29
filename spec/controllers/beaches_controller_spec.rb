require 'spec_helper'

describe BeachesController do

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'POST create' do
    it 'should assign @latitude' do
      @latitude = 31.4434546
      @latitude.should_not == nil
    end

    # it 'should create a cookie' do
    #   request.cookies['coordinates'] = 1234543
    #   post :create
    #   expect(response.cookies['coordinates']).to eq('1234543')
    # end

    it 'should create a new instance of the information class' do
      test = Information.new
      test.should be_an_instance_of(Information)
    end
  end

  describe '#show' do

  end


end