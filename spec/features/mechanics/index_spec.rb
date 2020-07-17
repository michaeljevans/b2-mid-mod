require 'rails_helper'

RSpec.describe 'Mechanics index page' do
  it 'displays a list of all mechanics and their years of experience' do
    park = AmusementPark.create!(name: 'Six Flags', admission_price: 25)
    ride_1 = park.rides.create!(name: 'Superman', thrill_rating: 10)
    mechanic_1 = ride_1.mechanics.create!(name: 'Tony', years_experience: 8)
    mechanic_2 = ride_1.mechanics.create!(name: 'Pat', years_experience: 12)

    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content("#{mechanic_1.name} - #{mechanic_1.years_experience} years of experience")
    expect(page).to have_content("#{mechanic_2.name} - #{mechanic_2.years_experience} years of experience")
  end
end
