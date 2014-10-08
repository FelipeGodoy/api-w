class GamesController < ApplicationController
  def index
    render json: 'Jogos'
  end

  def new
    ##url = localhost.ntp.uff.br:3000/games/new?nome=war1&jogador=jefferson&qtd_ter=42&qtd_obj=3&qtd_jog=3

    if params
      dados_jogo = {
          nome: params[:nome],
          jogador: params[:jogador],
          qtd_territorios: params[:qtd_ter],
          qtd_objetivos: params[:qtd_obj],
          qtd_jogadores: params[:qtd_jog]
      }
      render json: dados_jogo.to_json
    end
  end
end
