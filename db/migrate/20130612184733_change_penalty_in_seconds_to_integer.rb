class ChangePenaltyInSecondsToInteger < ActiveRecord::Migration
  def up
    change_column :rally_event_stage_times, :penalty_in_seconds, :integer, :default => 0
  end

  def down
    change_column :rally_event_stage_times, :penalty_in_seconds, :float, :default => 0
  end
end
