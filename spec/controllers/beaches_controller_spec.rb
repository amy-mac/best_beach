require 'spec_helper'

describe BeachesController, type: :controller do

  describe "GET index" do
    before { get :index }

    it "has a 200 status code" do
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end
  end

  describe "POST create" do
    let(:params) { {latitude: 37.7799177, longitude: -122.39494229999998} }

    context "when there is a latitude and longitude" do
      before { post(:create, params) }

      it "assigns the lat and long variables" do
        expect(assigns(:latitude)).to eq(params[:latitude].to_s)
        expect(assigns(:longitude)).to eq(params[:longitude].to_s)
      end

      it "creates a cookie" do
        expect(response.cookies["coordinates"]).to_not be_empty
      end
    end

    context "when there is no latitude and longitude" do
      let(:params) { {latitude: "", longitude: ""} }

      before { post(:create, params) }

      it "assigns the lat and long variables" do
        expect(assigns(:latitude)).to eq(params[:latitude])
        expect(assigns(:longitude)).to eq(params[:longitude])
      end

      it "does not create a cookie"

      it "does not make a call to Yelp API"
    end
  end

  describe "GET show" do
    let(:beach) { Beach.create(name: "Crissy Field", yelp_id: "crissy-field-san-francisco") }

    before do
      allow(controller).to receive(:origin_set).and_return("")
      get :show, {id: beach.yelp_id}
    end

    it "renders the :show template" do
      expect(response).to render_template(:show)
    end

    it "assigns the beach variable" do
      expect(assigns(:beach)).to eq(beach)
    end
  end
end
