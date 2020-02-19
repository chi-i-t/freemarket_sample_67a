require 'rails_helper'
# bundle exec rspec spec/controllers/items_controller_spec.rb

# ----------------- Reference ------------------
#   describe 'HTTPメソッド名 #アクション名' do
#     it "インスタンス変数は期待した値になるか？" do
#       "擬似的にリクエストを行ったことにするコードを書く"
#       "エクスペクテーションを書く"
#     end

#     it "期待するビューに遷移するか？" do
#       "擬似的にリクエストを行ったことにするコードを書く"
#       "エクスペクテーションを書く"
#     end
#   end
# -----------------------------------------------

describe ItemsController do

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested item to @item" do
      item = create(:item)
    end

    it "renders the :edit template" do
    end
  end

end