class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.integer :game_id
      t.integer :index_in_game
      t.string :content
      t.timestamps
    end
  end
end
