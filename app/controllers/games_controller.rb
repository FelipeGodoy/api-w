class GamesController < ApplicationController
  def index
    render :json => Game.actives.to_json
  end
  
  def show
    game = Game.find params[:id]
    render :json => game.full_json
  end
  
  def start
    game = Game.in_room.find params[:game_id]
    game.start
    render :json => game.full_json
  end
  
  def close
    game = Game.find params[:game_id]
    game.close
    render :json => game.full_json
  end
  
  def get_shots
    game = Game.actives.find params[:game_id]
    shots = game.shots.where("index_in_game > ?", params[:shot_id])
    render :json => shots.to_json
  end
  
  def reset_shots
    if Shot.delete_all
      render :json => {:success => true}.to_json
    else
      render :json => {:error => "Can't delete shots!"}.to_json
    end
  end
  
  def add_shot
    game = Game.actives.find params[:game_id]
    index = Integer(params[:shot_id])
    shots_count = game.shots.count
    if(index == shots_count + 1)
      shot = Shot.create(:game => game, :index_in_game => index, :content => params[:content])
      render :json => {:success => true, :id => shot.index_in_game}.to_json
    else
      render :json => {:error => "Wrong shot id"}.to_json
    end
  end
end
