# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rally_participant do
    rally_id 1
    start_number 1
    driver_name "MyString"
    co_driver_name "MyString"
    team_name "MyString"
    car_name "MyString"
    classification "MyString"
  end
end
