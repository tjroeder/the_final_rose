FactoryBot.define do
  factory :contestant do
    sequence(:name) { "name_#{n}" }
    sequence(:age)
    sequence(:hometown) { |n| "ht_#{n}" }
    bachelorette
  end
end
