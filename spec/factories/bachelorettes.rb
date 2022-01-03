FactoryBot.define do
  factory :bachelorette do
    sequence(:name) { |n| "name_#{n}" }
    sequence(:season_number)
    sequence(:description) { |n| "desc_#{n}" }
  end
end
