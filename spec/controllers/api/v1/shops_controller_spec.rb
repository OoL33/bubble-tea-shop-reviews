require "rails_helper"

RSpec.describe Api::V1::ShopsController, type: :controller do
  let!(:gong_cha) { Shop.create(name: "Gong Cha", address: "40-44 Harrison Ave", city: "Boston", state: "MA", zip: "02111") }
  let!(:onezo) { Shop.create(name: "OneZo", address: "83 Harrison Ave", city: "Boston", state: "MA", zip: "02111") }

  describe "GET#show" do 
    it "should return an individual bubble tea shop with all its attributes" do
      get :show, params: {id: gong_cha.id}
      returned_json = JSON.parse(response.body)["shop"]

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 10
      expect(returned_json["name"]).to eq gong_cha.name
      expect(returned_json["address"]).to eq gong_cha.address
      expect(returned_json["city"]).to eq gong_cha.city
      expect(returned_json["state"]).to eq gong_cha.state
      expect(returned_json["zip"]).to eq gong_cha.zip
    end
  end
end