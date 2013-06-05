# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rally do
    name "MyString"
    description "MyText"
    surface "MyString"
    starts_at "MyString"
    logo "MyString"
    is_current false
  end
end
