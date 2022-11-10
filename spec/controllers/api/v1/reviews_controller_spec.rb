require "rails_helper"

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers, type: :system
  config.include Warden::Test::Helpers, type: :request
  config.include Devise::Test::IntegrationHelpers, type: :system
  config.include Devise::Test::IntegrationHelpers, type: :request

  include ActionDispatch::TestProcess
end

RSpec.describe Api::V1::ReviewsController, type: :controller do
  let!(:gong_cha) { Shop.create(
    name: "Gong Cha",
    address: "40-44 Harrison Ave",
    city: "Boston",
    state: "MA",
    zip: "02111"
  ) }

  let!(:katie) { User.create(
    first_name: "Katie",
    last_name: "Foley",
    email: "katief906@gmail.com",
    password: "Ilovecoding4fun!"
  )}

  describe "POST#create" do
    it "creates a new review when provided data for all required fields and there's a user signed in" do
      sign_in katie
  
      post_json = {
        review: {
          rating: "5",
          body: "So good!",
          shop: gong_cha.id, 
          user: katie.id
        }
      }
  
      previous_count = Review.count
      post :create, params: {
        review: {
          rating: "5",
          body: "So good!" 
        },
        user_id: katie.id, 
        shop_id: gong_cha.id 
      }

      returned_json = JSON.parse(response.body)["review"]
  
      expect(Review.count).to eq(previous_count + 1)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
  
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(returned_json["rating"]).to eq 5
      expect(returned_json["body"]).to eq "So good!"
      expect(returned_json["user"]["id"]).to eq katie.id
      expect(returned_json["shop"]["id"]).to eq gong_cha.id
    end

    it "doesn't create a new review when required fields aren't filled out correctly" do 
      sign_in katie
      
      post_json = {
        review: {
          rating: "0", 
          body: "   ", 
          shop: gong_cha.id, 
          user: katie.id 
        }
      }

      previous_count = Review.count
      post :create, params: {
        review: {
          rating: "0",
          body: "   ",
          shop: gong_cha.id, 
          user: katie.id 
        },
        user_id: katie.id, 
        shop_id: gong_cha.id 
      }

      returned_json = JSON.parse(response.body)["review"]

      expect(Review.count).to eq(previous_count)
      expect(response.status).to eq 422
      expect(response.content_type).to eq("application/json")

      sign_out katie
    end

    it "doesn't create a new review when there's no user signed in" do 
      post_json = {
        review: {
          rating: "0", 
          body: "   ", 
          shop: Shop.first, 
          user: {} 
        }
      }

      previous_count = Review.count
      post :create, params: {
        review: {
          rating: "0",
          body: "   ",
          shop: gong_cha.id, 
          user: {}
        },
        shop_id: gong_cha.id 
      }

      returned_json = JSON.parse(response.body)["review"]

      expect(Review.count).to eq(previous_count)
      expect(response.status).to eq 422
      expect(response.content_type).to eq("application/json")
    end
  end
end