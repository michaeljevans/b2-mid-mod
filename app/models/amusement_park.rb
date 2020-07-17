class AmusementPark < ApplicationRecord
  validates_presence_of :name, :admission_price
  has_many :rides

  def sort_rides_alphabetically
    rides.order(:name)
  end

  def average_thrill_rating_for_all_rides
    rides.average(:thrill_rating)
  end
end
