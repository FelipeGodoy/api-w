class RoomsController < ApplicationController

  #url = http://http://localhost:3000/rooms/new?game={players=6&n_territories=42&name=jogo1&n_goals=15}
  
  def create
    g = Game.new(params[:game])
    g.in_room = true
    g.save
    render :json => game.to_json
  end

  def index
    render :json => Game.all.to_json
  end

  def connect
      game = Game.find(params[:game_id])
      if(game.present? && game.in_room?)
        p = Player.new(params[:player])
        p.game = game
        p.color = game.raffle_color
        p.save
        g_json = JSON.parse game.to_json
        g_json["new_player"] = JSON.parse p.to_json
        render :json => g_json.to_json
      end
  end

end