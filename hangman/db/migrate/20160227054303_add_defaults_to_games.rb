class AddDefaultsToGames < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.change :turns, :integer, default: 6
      t.change :state, :string, default: "in progress"
    end
  end
end
