# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rally_stage do
    rally_id 1
    name "MyString"
    length 1.5
    number 1
    surface "MyString"
    starts_at "MyString"
  end
end
