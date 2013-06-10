class AddPenaltyInSecondsToRallyEventStageTimes < ActiveRecord::Migration
  def change
    add_column :rally_event_stage_times, :penalty_in_seconds, :float
  end
end
