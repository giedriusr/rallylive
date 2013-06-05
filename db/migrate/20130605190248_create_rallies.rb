class CreateRallies < ActiveRecord::Migration
  def change
    create_table :rallies do |t|
      t.string :name
      t.text :description
      t.string :surface
      t.string :starts_at
      t.string :logo
      t.boolean :is_current, :default => false

      t.timestamps
    end
    add_index :rallies, :is_current
  end
end
