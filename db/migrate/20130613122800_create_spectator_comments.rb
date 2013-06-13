class CreateSpectatorComments < ActiveRecord::Migration
  def change
    create_table :spectator_comments do |t|
      t.integer :rally_id
      t.integer :stage_id
      t.string :name
      t.text :comment
      t.string :image
      t.string :ip_address

      t.timestamps
    end
    add_index :spectator_comments, :rally_id
    add_index :spectator_comments, :stage_id
  end
end
