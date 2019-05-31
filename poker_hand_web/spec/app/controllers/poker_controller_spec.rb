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
    it 'フルハウスくるか' do
      post :check, params: { id: "card", card: "H9 C9 S9 H2 C2" }
      expect(response.content_type).to eq "text/html"
      expect(response.body).to include URI::encode('フルハウス')
    end
  end

  describe 'POST check page' do
    it 'ストレートフラッシュがくるか' do
      post :check, params: { id: "card", card: "H1 H13 H12 H11 H10" }
      expect(response.content_type).to eq "text/html"
      expect(response.body).to include URI::encode('ストレートフラッシュ')
    end
  end

  describe 'POST check page' do
    it 'フォー・オブ・ア・カインドがくるか' do
      post :check, params: { id: "card", card: "D6 H6 S6 C6 S1" }
      expect(response.content_type).to eq "text/html"
      expect(response.body).to include URI::encode('フォー・オブ・ア・カインド')
    end
  end

  describe 'POST check page' do
    it 'フラッシュがくるか' do
      post :check, params: { id: "card", card: "S13 S12 S11 S9 S6" }
      expect(response.content_type).to eq "text/html"
      expect(response.body).to include URI::encode('フラッシュ')
    end
  end

  describe 'POST check page' do
    it 'ストレートがくるか' do
      post :check, params: { id: "card", card: "D6 S5 D4 H3 C2" }
      expect(response.content_type).to eq "text/html"
      expect(response.body).to include URI::encode('ストレート')
    end
  end

  describe 'POST check page' do
    it 'スリー・オブ・ア・カインドがくるか' do
      post :check, params: { id: "card", card: "C5 H5 D5 D12 C10" }
      expect(response.content_type).to eq "text/html"
      expect(response.body).to include URI::encode('スリー・オブ・ア・カインド')
    end
  end

  describe 'POST check page' do
    it 'ツーペアがくるか' do
      post :check, params: { id: "card", card: "D11 S11 S10 C10 S9" }
      expect(response.content_type).to eq "text/html"
      expect(response.body).to include URI::encode('ツーペア')
    end
  end

  describe 'POST check page' do
    it 'ワンペアがくるか' do
      post :check, params: { id: "card", card: "H9 C9 H1 D12 D10" }
      expect(response.content_type).to eq "text/html"
      expect(response.body).to include URI::encode('ワンペア')
    end
  end

  describe 'POST check page' do
    it 'ハイカードがくるか' do
      post :check, params: { id: "card", card: "C13 D12 C11 H8 H7" }
      expect(response.content_type).to eq "text/html"
      expect(response.body).to include URI::encode('ハイカード')
    end
  end

  describe 'POST check page' do
    it '五つ項目ではないというメッセージがくるか' do
      post :check, params: { id: "card", card: "H4 H5 H6 H7" }
      expect(response.content_type).to eq "text/html"
      message = URI::decode response.body
      expect(message).to include '入力データサイズが５ではありません！5つのカード指定文字を半角スペース区切りで入力してください。（例：S1+H3+D9+C13+S11）'
    end
  end

  describe 'POST check page' do
    it 'いらないスペースというメッセージがくるか' do
      post :check, params: { id: "card", card: "H4 H5 H6 H7 H2   " }
      expect(response.content_type).to eq "text/html"
      message = URI::decode response.body
      expect(message).to include 'いらないスペースが記載されました！見直してください！'
    end
  end


  describe 'POST check page' do
    it '重複のチェックというメッセージがくるか' do
      post :check, params: { id: "card", card: "H1 H13 H12 H11 H11"}
      expect(response.content_type).to eq "text/html"
      message = URI::decode response.body
      expect(message).to include '入力されたデータが重複しています！'
    end
  end

  describe 'POST check page' do
    it 'スートチェック：S, H, D, Cおよび数字チェック: 1-13のチェックというメッセージがくるか' do
      post :check, params: { id: "card", card: "H1 H13 H12 P11 H22"}
      expect(response.content_type).to eq "text/html"
      message = URI::decode response.body
      expect(message).to include '1番目行の文字のP11、1番目行の数字のH22、の入力されたデータが不正です！半角英字大文字のスート（S,H,D,C）と数字（1〜13）の組み合わせでカードを指定してください。'
    end
  end
end