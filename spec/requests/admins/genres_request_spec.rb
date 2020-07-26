require 'rails_helper'

RSpec.describe "Genres", type: :request do
  describe 'ジャンル一覧' do
    context "ジャンル一覧ページが正しく表示される" do
      before do
        get admins_genres_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
end