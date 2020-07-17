# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
park_1 = AmusementPark.create!(name: 'Six Flags', admission_price: 40)
ride_1 = park_1.rides.create!(name: 'Superman', thrill_rating: 10)
ride_2 = park_1.rides.create!(name: 'Scrambler', thrill_rating: 4)
ride_3 = park_1.rides.create!(name: 'Zingo', thrill_rating: 7)
ride_4 = park_1.rides.create!(name: 'Car Bump', thrill_rating: 2)
mechanic_1 = Mechanic.create!(name: 'Tony Bologna', years_experience: 9)
mechanic_2 = Mechanic.create!(name: 'Jimmy Neutron', years_experience: 8)
RideMechanic.create!(ride_id: "#{ride_1.id}", mechanic_id: "#{mechanic_1.id}")
RideMechanic.create!(ride_id: "#{ride_2.id}", mechanic_id: "#{mechanic_1.id}")
RideMechanic.create!(ride_id: "#{ride_3.id}", mechanic_id: "#{mechanic_1.id}")
RideMechanic.create!(ride_id: "#{ride_2.id}", mechanic_id: "#{mechanic_2.id}")
RideMechanic.create!(ride_id: "#{ride_4.id}", mechanic_id: "#{mechanic_2.id}")
