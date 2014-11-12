require 'rails_helper'


RSpec.describe GamesController, :type => :controller do
  let (:game1) {FactoryGirl.create Game}
  describe "GET" do
    it "index" do
      get :index
      expect(response).to be_success
    end
    it "show with id" do
      binding.pry
      get :show, :game_id => :game1.id
      expect(response).to be_success
    end
    it "show withou id" do
      binding.pry
      get :show
      expect(response).to be_fail
    end
  end
end
