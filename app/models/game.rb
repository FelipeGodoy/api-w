class Game < ActiveRecord::Base
  self.table_name = 'games'

  @@id = 0

  def new(n_pla,n_terr,n_obj)
    @@id += 1
  end

  def self.id
    @@id
  end

  private

  def connect_game id
    game.update(:id => id,:active => 1)
  end
end