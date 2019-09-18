class Rating < ApplicationRecord
  RATINGS = [1, 2, 3, 4, 5].freeze

  belongs_to :restaurant

  validates :rate, numericality: { only_integer: true, inclusion: RATINGS }
end
