# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: '11111111', password_confirmation: '11111111') if Rails.env.development?

letters = ('a'..'z').to_a
100.times do |i|
  restaurant = Restaurant.new(name: "#{Faker::Restaurant.name}#{letters.sample}",
                              description: Faker::Restaurant.description,
                              cousine: Faker::Restaurant.type,
                              is_open: true,
                              logo: File.open(Rails.root.join('spec', 'support', 'files', 'dummy_image.png'))
  )

  WorkingHour::WEEK_DAYS.each do |week_day|
    restaurant.working_hours.build(week_day: week_day,
                                   start_time: "#{rand(0..10)}:#{rand(0..59)}",
                                   end_time: "#{rand(11..23)}:#{rand(0..59)}")
  end

  rand(20).times do
    restaurant.ratings.build(rate: rand(1..5))
  end

  restaurant.save!
end
