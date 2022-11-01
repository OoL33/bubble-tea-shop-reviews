require 'rails_helper'

feature 'user visits index page' do

  let!(:gong_cha) { Shop.create(name: "Gong Cha", address: "40-44 Harrison Ave", city: "Boston", state: "MA", zip: "02111") }
  let!(:onezo) { Shop.create(name: "OneZo", address: "83 Harrison Ave", city: "Boston", state: "MA", zip: "02111") }

  scenario 'user sees list of bubble tea shops' do
    visit "/"

    expect(page).to have_content "Gong Cha"
    expect(page).to have_content "OneZo"
  end
end