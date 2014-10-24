class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :infos
      t.string :players
      t.integer :n_territories
      t.integer :n_goals
      t.boolean :active
      t.boolean :in_room
      t.timestamps
    end
  end
end
