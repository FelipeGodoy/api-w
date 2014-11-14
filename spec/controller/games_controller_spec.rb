require 'rails_helper'


RSpec.describe GamesController, :type => :controller do
  before(:each) do
    @game = FactoryGirl.create Game
    @player = FactoryGirl.create Player, :game_id => @game.id
    @shoot = FactoryGirl.create Shot, :game_id => @game.id
  end
  describe "GET" do
    it "index" do
      get :index
      expect(response).to be_success
    end
    it "show" do
      get :show, :id => @game.id
      expect(response).to be_success
    end
    it "reset_shots" do
      get :reset_shots
      expect(response).to be_success
    end
    it "get_shoots" do
       get :get_shots,  :game_id => @game.id, :id => @shoot.id
       expect(response).to be_success
    end
  end

  describe "POST" do
    it "start" do
      post :start, :game_id => @game.id
      expect(response).to be_success
    end
    it "close" do
      post :close, :game_id => @game.id
      expect(response).to be_success
    end
    it "clear" do
      post :clear, :game_id => @game.id
      expect(response).to be_success
    end
    it "add_shot" do
      post :add_shot, :game_id => @game.id, :shot_id => @shoot.id
      expect(response).to be_success
    end

  end
end
