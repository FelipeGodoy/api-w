class GamesController < ApplicationController
  def index
    render :json => Game.actives.to_json
  end

  def show
    if params[:id]
      game = Game.find params[:id]
      render :json => game.full_json
    else
      render :json => {:error => "Can't show a game without game_id!"}.to_json
    end
  end

  def start
    if params[:game_id]
      game = Game.in_room.find params[:game_id]
      game.start if game.active
      render :json => game.full_json
    else
      render :json => {:error => "Can't start a game without game_id!"}.to_json
    end
  end

  def close
    if params[:game_id]
      game = Game.find params[:game_id]
      game.close
      render :json => game.full_json
    else
      render :json => {:error => "Can't close a game without game_id!"}.to_json
    end

  end

  def get_shots
    if params[:game_id]
      game = Game.actives.find params[:game_id]
      shots = game.shots.where("index_in_game > ?", params[:shot_id])
      render :json => shots.to_json
    else
      render :json => {:error => "Can't find shots without game_id!"}.to_json
    end
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
    if (index == shots_count + 1)
      shot = nil
      params[:shots].each_with_index do |param_shot, ind|
        shot = Shot.create(:game => game, :index_in_game => index, :content => params["shots"][ind.to_s]["content"])
        index +=1
      end
      render :json => {:success => true, :id => shot.index_in_game, :shots_saved => params[:shots].count}.to_json
    else
      render :json => {:error => "Wrong shot id"}.to_json
    end
  end
end

