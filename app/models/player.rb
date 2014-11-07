class Player < ActiveRecord::Base
  belongs_to :game
  
  def fill_color
    self.color = self.game.raffle_color
    self.save
  end
  
end
