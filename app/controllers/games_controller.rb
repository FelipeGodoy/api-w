class GamesController < ApplicationController
  def index
    render :json => Game.actives.to_json
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
  
  def add_shot
    game = Game.actives.find params[:game_id]
    index = Integer(params[:shot_id])
    shots = game.shots.where("Shot.in_game_id > ?", index)
    if(index == shots.count + 1)
      shot = Shot.create(:game => game, :id_in_game => index, :content => params[:content])
      render :json => shot.to_json
    else
      render :json => {:error => "Wrong shot id"}
    end
  end

#  def new
#    ##url = http://localhost:3000/games/new?n_objectives=14&n_territories=42&n_players=5
#    if params
#
#      n_territories = params[:n_territories]
#      n_objectives = params[:n_objectives]
#      n_players = params[:n_players]
#      ##TODO: criar forma de armazenar id_jogo
#      #aqui se cria um jogo
#      hash_ter = draw_territory n_players, n_territories
#      hash_obj = draw_objectives n_players, n_objectives
#      arr_odr = player_order n_players
#      @game = Game.create(:n_pla => n_players,:n_terr => n_territories,:n_obj => n_objectives )
#      game = {
#          :id_game => Game.id,
#          :territories => hash_ter,
#          :objectives => hash_obj,
#          :player_order => arr_odr
#      }
#      render :json => game.to_json
#    end
#  end


#  def draw_territory num_player, n_territories
#    num_territories = n_territories.to_i
#    hash = Hash.new
#    territories = (1..num_territories).to_a.shuffle
#    a = 1
#    territories.each do |i|
#      hash[i] = a
#      if a == num_player.to_i
#        a = 1
#      else
#        a = a + 1
#      end
#    end
#    hash
#  end

#  def player_order num_player
#    order = (1..num_player.to_i).to_a.shuffle
#    order
#  end

#  def draw_objectives num_player, n_objectives
#    num_objectives = n_objectives.to_i
#    hash = Hash.new
#    ##TODO: Implementar restrição de objetivos
#    objectivies = (1..num_objectives).to_a.shuffle
#    for i in 1..num_player.to_i
#      hash[i] = objectivies[i]
#    end
#    hash
#  end
end
