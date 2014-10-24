class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :type
      t.integer :goal_id
      t.integer :id_ingame
      t.timestamps
    end
  end
end
