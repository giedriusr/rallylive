class CreateRallyParticipants < ActiveRecord::Migration
  def change
    create_table :rally_participants do |t|
      t.integer :rally_id
      t.integer :start_number
      t.string :driver_name
      t.string :co_driver_name
      t.string :team_name
      t.string :car_name
      t.string :classification

      t.timestamps
    end
    add_index :rally_participants, :rally_id
  end
end
