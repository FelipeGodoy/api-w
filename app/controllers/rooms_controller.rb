class RoomsController < ApplicationController

  #url = http://http://localhost:3000/rooms/new?game={players=6&n_territories=42&name=jogo1&n_goals=15}
  
  def create
    params.permit!
    game = Game.new(params[:game])
    game.in_room = true
    game.save
    render :json => game.to_json
  end

  def index
    render :json => Game.in_room.to_json
  end

  def connect
    game = Game.in_room.find(params[:game_id])
#    binding.pry
    if game.present?
      params.permit!
      p = Player.new(params[:player])
      p.game = game
      p.color = game.raffle_color
      p.save
      g_json = JSON.parse game.to_json
      g_json["new_player"] = JSON.parse p.to_json
      render :json => g_json.to_json
    else
      render :json => {:error => "Can't connect"}
    end
  end
  
  def disconnect
    player = Player.find params[:player]
    player.game = nil
    player.save
    render :json => player.errors.to_json
  end

end