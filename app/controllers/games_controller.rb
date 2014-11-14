class GamesController < ApplicationController
  def index
    render :json => Game.actives.to_json
  end

  def show
    if params[:id]
      game = Game.find params[:id]
      order = game.players.map(&:order)
      render :json => game.full_json
    else
      render :json => {:error => "Can't show a game without id!"}
    end
  end

  def clear
    if Game.destroy_all
      render :json => {:sucess => :true}
    else
      render :json => {:sucess => :false}
    end
  end

  def start
    if params[:game_id]
      game = Game.in_room.find params[:game_id]
      game.start unless game.active
	  Game.where("updated_at < ?", Time.now - 1.day).destroy_all
      render :json => game.full_json
    else
      render :json => {:error => "Can't start a game without game_id!"}
    end
  end

  def close
    if params[:game_id]
      game = Game.find params[:game_id]
      game.close
      render :json => game.full_json
    else
      render :json => {:error => "Can't close a game without game_id!"}
    end

  end

  def get_shots
    if params[:game_id]
      game = Game.actives.find params[:game_id]
      shots = game.shots.where("index_in_game > ?", params[:shot_id]).order(:index_in_game)
      shots_json = JSON.parse shots.to_json
      shots_json.each do |shot|
        shot["content"] = JSON.parse shot["content"]
      end
      render :json => shots_json.to_json
    else
      render :json => {:error => "Can't find shots without game_id!"}
    end
  end

  def reset_shots
    if Shot.delete_all
      render :json => {:success => true}.to_json
    else
      render :json => {:error => "Can't delete shots!"}
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
      render :json => {:error => "Wrong shot id"}
    end
  end
end

