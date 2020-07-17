require 'rails_helper'

RSpec.describe 'Amusement park show page' do
  it 'displays name and price of admission, a list of its rides in alphabetical order, and average thrill rating' do
    park = AmusementPark.create!(name: 'Six Flags', admission_price: 40)
    ride_1 = park.rides.create!(name: 'Superman', thrill_rating: 10)
    ride_2 = park.rides.create!(name: 'Scrambler', thrill_rating: 4)
    ride_3 = park.rides.create!(name: 'Zingo', thrill_rating: 6)
    ride_4 = park.rides.create!(name: 'Car Bump', thrill_rating: 1)

    visit "/amusement_parks/#{park.id}"

    expect(page).to have_content("#{park.name}")
    expect(page).to have_content("Price of Admission: $#{park.admission_price}")

    within '.rides' do
      expect(page.all('li')[0]).to have_content("#{ride_4.name}")
      expect(page.all('li')[1]).to have_content("#{ride_2.name}")
      expect(page.all('li')[2]).to have_content("#{ride_1.name}")
      expect(page.all('li')[3]).to have_content("#{ride_3.name}")
    end

    expect(page).to have_content("Average Thrill Rating: 5.25/10")
  end
end
