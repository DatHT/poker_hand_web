require "rails_helper"

# coding: utf-8
RSpec.describe PokerController, :type => :controller do
  # before do
  #   @card = FactoryGirl.attributes_for(:card)
  # end

  describe 'GET home page' do
    it 'has a 200 status code' do
      get :home
      expect(response.status).to eq(200)
    end
  end

  describe 'POST check page' do
    it 'responds to html page ' do
      post :check, params: { id: "card", card: "H9 C9 S9 H2 C2" }
      expect(response.content_type).to eq "text/html"
      expect(response.body).to include URI::encode('フルハウス')
    end
  end
end