# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    first_line "MyText"
    second_line "MyText"
    city "MyText"
    state "MyText"
    zip "MyText"
    country "MyText"
    addressable_id 1
    addressable_type "MyString"
  end
end
