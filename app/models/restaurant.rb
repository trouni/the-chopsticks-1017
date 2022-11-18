class Restaurant < ApplicationRecord
  # associations
  has_many :reviews # creates a method -> restaurant.reviews
  # validations
  validates :name, presence: true
  validates :address, presence: true

  def avg_rating
    return unless reviews.any?

    reviews.average(:rating).round
  end
end
