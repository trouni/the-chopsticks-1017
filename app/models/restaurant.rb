class Restaurant < ApplicationRecord
  # associations
  has_many :reviews # creates a method -> restaurant.reviews
  # validations
  validates :name, presence: true
  validates :address, presence: true
end
