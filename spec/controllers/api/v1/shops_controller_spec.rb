require "rails_helper"

RSpec.describe Api::V1::ShopsController, type: :controller do
  let!(:gong_cha) { Shop.create(name: "Gong Cha", address: "40-44 Harrison Ave", city: "Boston", state: "MA", zip: "02111", telephone: "(617) 574-4870", website: "https://gongchausa.com/", picture: "https://bdc2020.o0bc.com/wp-content/uploads/2022/08/Gong-Cha-630e244f838ea.jpeg") }
  let!(:onezo) { Shop.create(name: "OneZo", address: "83 Harrison Ave", city: "Boston", state: "MA", zip: "02111", telephone: "(617) 982-6985", website: "https://www.onezo.us/", picture: "https://d1ralsognjng37.cloudfront.net/c370272a-288b-4a80-b0d5-ccdfe11abece.jpeg") }

  let!(:katie) { User.create(
    first_name: "Katie",
    last_name: "Foley",
    email: "katief906@gmail.com",
    password: "Ilovecoding4fun!",
    role: "admin"
  )}

  let!(:karen) { User.create(
    first_name: "Karen",
    last_name: "Wong",
    email: "karen@aol.com",
    password: "Bobalover2022",
    role: "member"
  )}

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

      expect(returned_json.length).to eq 11
      expect(returned_json["name"]).to eq gong_cha.name
      expect(returned_json["address"]).to eq gong_cha.address
      expect(returned_json["city"]).to eq gong_cha.city
      expect(returned_json["state"]).to eq gong_cha.state
      expect(returned_json["zip"]).to eq gong_cha.zip
    end
  end

  describe "POST#create" do
    it "creates a new shop when provided data for all required fields and the user is an admin" do
      sign_in katie

      post_json = {
        shop: {
          name: "TBaar", 
          address: "32 Kneeland St", 
          city: "Boston", 
          state: "MA", 
          zip: "02111"
        }
      }

      previous_count = Shop.count
      post(:create, params: post_json, format: :json)
      returned_json = JSON.parse(response.body)["shop"]

      expect(Shop.count).to eq(previous_count + 1)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(returned_json["name"]).to eq "TBaar"
      expect(returned_json["address"]).to eq "32 Kneeland St"
      expect(returned_json["city"]).to eq "Boston"
      expect(returned_json["state"]).to eq "MA"
      expect(returned_json["zip"]).to eq "02111"
    end

    it "doesn't create a new shop when required fields aren't filled out correctly" do 
      sign_in katie

      post_json = {
        shop: {
          name: "Kung Fu", 
          address: "   ", 
          city: "", 
          state: "", 
          zip: ""
        }
      }

      previous_count = Shop.count
      post(:create, params: post_json, format: :json)
      returned_json = JSON.parse(response.body)["shop"]

      expect(Shop.count).to eq(previous_count)

      expect(response.status).to eq 422
      expect(response.content_type).to eq("application/json")

      sign_out katie
    end
  end
end