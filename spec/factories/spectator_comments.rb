# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :spectator_comment do
    rally_id "MyString"
    stage_id "MyString"
    name "MyString"
    comment "MyText"
    image "MyString"
    ip_address "MyString"
  end
end
