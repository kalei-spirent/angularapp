class CreateTrafficProfiles < ActiveRecord::Migration
  def change
    create_table :traffic_profiles do |t|
    	t.string :name
      	t.timestamps
    end
  end
end
