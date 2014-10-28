class RoomsController < ApplicationController

  #url = http://http://localhost:3000/rooms/new?players=6&n_territories=42&name=jogo1&n_goals=15

  def new
    if params[:name] && params[:n_territories] && params[:players]
      game = Game.create ({:name => params[:name],
                           :n_territories => params[:n_territories],
                           :players => params[:players],
                           :n_goals => params[:n_goals],
                           :active => 0})
      render :json => game.to_json
    end
  end

  def index
    render :json => Game.all.to_json
  end

  def connect
    if params[:id]
      game = Game.find(params[:game_id])
      game.connect_game game.id
      render game.to_json
    end
    #players_json = JSON.parse(game.players)
  end

end