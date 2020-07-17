require 'rails_helper'

RSpec.describe 'Mechanic show page' do
  it 'displays name, years of experience, and rides the mechanic is working on' do
    park = AmusementPark.create!(name: 'Six Flags', admission_price: 40)
    ride_1 = park.rides.create!(name: 'Superman', thrill_rating: 10)
    ride_2 = park.rides.create!(name: 'Zingo', thrill_rating: 6)
    ride_3 = park.rides.create!(name: 'Car Bump', thrill_rating: 1)
    mechanic = Mechanic.create!(name: 'Tony Bologna', years_experience: 8)
    RideMechanic.create!(ride_id: ride_1.id, mechanic_id: mechanic.id)
    RideMechanic.create!(ride_id: ride_3.id, mechanic_id: mechanic.id)

    visit "/mechanics/#{mechanic.id}"

    expect(page).to have_content("Mechanic: #{mechanic.name}")
    expect(page).to have_content("Years of Experience: #{mechanic.years_experience}")

    within '.rides' do
      expect(page).to have_content("#{ride_1.name}")
      expect(page).to have_content("#{ride_3.name}")
      expect(page).to_not have_content("#{ride_2.name}")
    end
  end

  it 'displays a form to add a ride to the mechanics workload' do
    park = AmusementPark.create!(name: 'Six Flags', admission_price: 40)
    ride_1 = park.rides.create!(name: 'Superman', thrill_rating: 10)
    ride_2 = park.rides.create!(name: 'Zingo', thrill_rating: 6)
    ride_3 = park.rides.create!(name: 'Car Bump', thrill_rating: 1)
    mechanic = Mechanic.create!(name: 'Tony Bologna', years_experience: 8)
    RideMechanic.create!(ride_id: ride_1.id, mechanic_id: mechanic.id)
    RideMechanic.create!(ride_id: ride_3.id, mechanic_id: mechanic.id)

    visit "/mechanics/#{mechanic.id}"

    expect(page).to have_content("Add Ride for Maintenance:")

    fill_in :ride_id, with: "#{ride_2.id}"
    click_button "Add Ride"

    expect(current_path).to eq("/mechanics/#{mechanic.id}")

    within '.rides' do
      expect(page).to have_content("#{ride_1.name}")
      expect(page).to have_content("#{ride_3.name}")
      expect(page).to have_content("#{ride_2.name}")
    end
  end
end
