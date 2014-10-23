class RoomsController < ApplicationController
  def new
    #url =
    n_territories = params[:n_territories]
    n_objectives = params[:n_objectives]
    n_players = params[:n_players]
    nome = params[:nome]
    room = {
      :idroom => 1,
      :nome => params[:nome]
    }
    render :json => room.to_json

  end

  def connect
    id_jogador = params[:id_jogador]

    connect = {}

    render :json => connect.to_json
  end





end