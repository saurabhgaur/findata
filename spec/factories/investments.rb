# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :investment do
    user_id ""
    institution_name ""
    first_owner_name ""
    second_owner_name ""
    account_number ""
    notes ""
    nominee "MyString"
  end
end
