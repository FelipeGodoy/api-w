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
    if game.present? && game.players.count < 6
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
    params[:players].each_with_index do |player_id,index|
		player = Player.find (params["players"][index.to_s].to_i)
		game = player.game
		player.game = nil
		player.destroy
		game.reload
		if game.players.count ==0
			game.destroy
		end
	end
    render :json => {:sucess => true}.to_json
  end

end