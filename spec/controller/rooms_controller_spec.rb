require 'rails_helper'


RSpec.describe RoomsController, :type => :controller do
  before(:each) do
    @game = FactoryGirl.create Game
    @player = FactoryGirl.create Player, :game_id => @game.id
    @shoot = FactoryGirl.create Shot, :game_id => @game.id
  end
  describe "POST" do
    it "connect" do
      post :connect, :game_id => @game.id
      expect(response).to be_success
    end
    it "disconnect" do
      post :disconnect, :player => @player
      expect(response).to be_success
    end
  end
end
