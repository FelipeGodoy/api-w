class AddDefaultFalseToColumnActiveInGames < ActiveRecord::Migration
  def change
    change_column :games, :active, :boolean, :default => false
  end
end
