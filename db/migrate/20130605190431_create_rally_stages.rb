class CreateRallyStages < ActiveRecord::Migration
  def change
    create_table :rally_stages do |t|
      t.integer :rally_id
      t.string :name
      t.float :length
      t.integer :number
      t.string :surface
      t.string :starts_at

      t.timestamps
    end
    add_index :rally_stages, :rally_id
  end
end
