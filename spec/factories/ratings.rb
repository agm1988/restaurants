FactoryBot.define do
  factory :rating do
    restaurant
    rate { Rating::RATINGS.sample }
  end
end
