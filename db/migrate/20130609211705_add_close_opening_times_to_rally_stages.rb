class AddCloseOpeningTimesToRallyStages < ActiveRecord::Migration
  def change
    add_column :rally_stages, :closing_at, :string
    add_column :rally_stages, :opening_at, :string
  end
end
