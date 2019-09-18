class Rating < ApplicationRecord
  RATINGS = [1, 2, 3, 4, 5].freeze

  belongs_to :restaurant

  validates :rate, numericality: { only_integer: true,
                                   greater_than: 0,
                                   less_than_or_equal_to: 5 }
  validates :rate, :restaurant, presence: true
end
