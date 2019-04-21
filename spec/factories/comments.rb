FactoryBot.define do
  factory :comment do
    content {Faker::Lorem.paragraph}
    post { nil}
    thrashed {false}
  end
end