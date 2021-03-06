class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :game_id
      t.integer :type_id
      t.integer :goal_id
      t.integer :order
      t.integer :color
      t.string :init_territories
      t.timestamps
    end
  end
end
