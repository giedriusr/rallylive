class CreateRallyEventStageTimes < ActiveRecord::Migration
  def change
    create_table :rally_event_stage_times do |t|
      t.integer :rally_id
      t.integer :stage_id
      t.integer :participant_id
      t.integer :stage_number
      t.float :time

      t.timestamps
    end
    add_index :rally_event_stage_times, :rally_id
    add_index :rally_event_stage_times, :stage_id
    add_index :rally_event_stage_times, :participant_id
    add_index :rally_event_stage_times, :stage_number
  end
end
