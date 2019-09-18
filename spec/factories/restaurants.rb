FactoryBot.define do
  factory :restaurant do
    sequence(:name) { Faker::Restaurant.name  }
    sequence(:description) { Faker::Restaurant.description  }
    sequence(:cousine) { Faker::Restaurant.type  }
    is_open { true }
    logo { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'dummy_image.png'), 'image/png') }
  end

  trait :closed do
    is_open { false }
  end

  trait :with_ratings do
    transient do
      ratings_count { 5 }
    end

    after(:build) do |_restaurant, evaluator|
      build_list(:rating, evaluator.ratings_count)
    end
  end
end
