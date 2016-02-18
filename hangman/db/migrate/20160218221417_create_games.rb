class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :answer
      t.integer :turns
      t.string :guess
      t.string :state

      t.timestamps null: false
    end
  end
end
