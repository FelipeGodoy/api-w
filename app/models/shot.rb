class Shot < ActiveRecord::Base
  belongs_to :game
  
  scope :in_game_order, ->{order(:in_game_id)}
end
