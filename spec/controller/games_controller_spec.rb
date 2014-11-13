require 'rails_helper'


RSpec.describe GamesController, :type => :controller do
  before(:each) do
    @game = FactoryGirl.create Game
    @player = FactoryGirl.create Player, :game_id => @game.id
  end
  describe "GET" do
    it "index" do
      get :index
      expect(response).to be_success
    end
    it "show with id" do
      get :show, :id => @game.id
      expect(response).to be_success
    end
    it "start" do
      get :start, :game_id => @game.id
      expect(response).to be_success
    end
    it "close" do
      get :close, :game_id => @game.id
      expect(response).to be_success
    end
    it "clear" do
      get :clear, :game_id => @game.id
      expect(response).to be_success
    end

  end
end
