require 'rails_helper'

feature 'user visits show page' do

  let!(:gong_cha) { Shop.create(name: "Gong Cha", address: "40-44 Harrison Ave", city: "Boston", state: "MA", zip: "02111") }
  let!(:onezo) { Shop.create(name: "OneZo", address: "83 Harrison Ave", city: "Boston", state: "MA", zip: "02111") }

  scenario 'user clicks a bubble tea shop link' do
    visit "/"
    click_link "Gong Cha"

    expect(page).to have_current_path "/shops/#{gong_cha[:id]}"
    expect(page).to have_content gong_cha.name
    expect(page).to have_content gong_cha.address
    expect(page).to have_content gong_cha.city
    expect(page).to have_content gong_cha.state
    expect(page).to have_content gong_cha.zip
  end
end