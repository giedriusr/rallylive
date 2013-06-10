class CreateRallyEventRetirements < ActiveRecord::Migration
  def change
    create_table :rally_event_retirements do |t|
      t.integer :rally_id
      t.integer :participant_id
      t.integer :stage_id
      t.string :reason

      t.timestamps
    end
    add_index :rally_event_retirements, :rally_id
    add_index :rally_event_retirements, :participant_id
    add_index :rally_event_retirements, :stage_id
  end
end
