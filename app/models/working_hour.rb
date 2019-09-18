class WorkingHour < ApplicationRecord
  WEEK_DAYS = %i[monday tuesday wednesday thursday friday saturday sunday].freeze
  belongs_to :restaurant

  enum week_day: WEEK_DAYS

  validates :week_day, :start_time, :end_time, presence: true
  validates :week_day, uniqueness: { scope: :restaurant_id }
end
