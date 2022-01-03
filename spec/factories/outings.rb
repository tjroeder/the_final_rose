FactoryBot.define do
  factory :outing do
    sequence(:name) { |n| "name_#{n}" }
    sequence(:location) { |n| "loc_#{n}" }
    sequence(:date) { |n| "01/01/2#{n}" }
  end
end
