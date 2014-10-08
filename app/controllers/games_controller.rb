class GamesController < ApplicationController
  def index
    render json: 'Jogos'
  end

  def new
    if params
      dados_jogo = {
          nome: params[:nome],
          jogador: params[:jogador],
          qtd_territorios: params[:qtd_ter],
          qtd_objetivos: params[:qtd_obj],
          qtd_jogadores: params[:qtd_jog]
      }

    end
  end
end
