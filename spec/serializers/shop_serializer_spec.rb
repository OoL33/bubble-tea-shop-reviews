require "rails_helper"

RSpec.describe ShopSerializer, type: :serializer do
  let!(:gong_cha) { Shop.create(
    name: "Gong Cha",
    address: "40-44 Harrison Ave",
    city: "Boston", 
    state: "MA",
    zip: "02111",
    telephone: "(617) 574-4870",
    website: "https://gongchausa.com/",
    picture: "https://bdc2020.o0bc.com/wp-content/uploads/2022/08/Gong-Cha-630e244f838ea.jpeg"
  ) }

  describe '.serializable_hash' do
    subject { described_class.new(gong_cha).serializable_hash }

    it { expect(subject).to include(:id, :name, :picture, :city) }

    it 'returns correct keys and values' do
      expect(subject).to include(
        id: be_an(Integer),
        name: be_a(String),
        picture: (be_a(String).or be_nil),
        city: be_a(String)
      )
    end
  end
end