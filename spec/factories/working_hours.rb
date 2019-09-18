FactoryBot.define do
  factory :working_hour do
    restaurant
    week_day { WorkingHour::WEEK_DAYS.sample }
    start_time { '10:00' }
    end_time { '18:00' }
  end
end
