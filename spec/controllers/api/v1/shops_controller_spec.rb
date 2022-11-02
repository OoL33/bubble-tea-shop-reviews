require "rails_helper"

RSpec.describe Api::V1::ShopsController, type: :controller do
  let!(:gong_cha) { Shop.create(name: "Gong Cha", address: "40-44 Harrison Ave", city: "Boston", state: "MA", zip: "02111", telephone: "(617) 574-4870", website: "https://gongchausa.com/", picture: "https://bdc2020.o0bc.com/wp-content/uploads/2022/08/Gong-Cha-630e244f838ea.jpeg") }
  let!(:onezo) { Shop.create(name: "OneZo", address: "83 Harrison Ave", city: "Boston", state: "MA", zip: "02111", telephone: "(617) 982-6985", website: "https://www.onezo.us/", picture: "https://d1ralsognjng37.cloudfront.net/c370272a-288b-4a80-b0d5-ccdfe11abece.jpeg") }

  describe "GET#index" do
    it "should return a list of all the shops" do
      get :index
      returned_json = JSON.parse(response.body)["shops"]
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json[0]["name"]).to eq "Gong Cha"
      expect(returned_json[1]["name"]).to eq "OneZo"
    end
  end

  describe "GET#show" do 
    it "should return an individual bubble tea shop with all its attributes" do
      get :show, params: {id: gong_cha.id}
      returned_json = JSON.parse(response.body)["shop"]

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 9
      expect(returned_json["name"]).to eq gong_cha.name
      expect(returned_json["address"]).to eq gong_cha.address
      expect(returned_json["city"]).to eq gong_cha.city
      expect(returned_json["state"]).to eq gong_cha.state
      expect(returned_json["zip"]).to eq gong_cha.zip
    end
  end
end