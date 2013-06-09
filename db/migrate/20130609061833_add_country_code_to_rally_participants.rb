class AddCountryCodeToRallyParticipants < ActiveRecord::Migration
  def change
    add_column :rally_participants, :country_code, :string
  end
end
