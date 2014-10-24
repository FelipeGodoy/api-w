class RoomsController < ApplicationController

  def create
    game = Game.create params[:game]
    render :json => game.to_json
  end

  def index
    render :json => game.all.to_json
  end

  def connect
    game = Game.find(params[:game_id])

  end

end