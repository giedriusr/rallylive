# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rally_event_retirement do
    rally_id 1
    participant_id 1
    stage_id 1
    reason "MyString"
  end
end
