# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rally_event_stage_time do
    rally_id 1
    stage_id 1
    participant_id 1
    stage_number 1
    time 1.5
  end
end
