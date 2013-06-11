class AddIsCurrentToRallyStages < ActiveRecord::Migration
  def change
    add_column :rally_stages, :is_current, :boolean, :default => false
    add_index :rally_stages, :is_current
  end
end
