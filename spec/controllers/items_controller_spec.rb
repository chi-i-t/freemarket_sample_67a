require 'rails_helper'
# bundle exec rspec spec/controllers/items_controller_spec.rb

describe ItemsController do

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

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end


  describe 'GET #edit' do
    it "assigns the requested tweet to @tweet" do
      item = create(:item)
      get :edit, params: { id: item }
      expect(assigns(:item)).to eq item
    end
  
    it "renders the :edit template" do
      tweet = create(:tweet)
      get :edit, params: { id: item }
      expect(response).to render_template :edit
    end
  end


  describe 'GET #index' do
    it "populates an array of tweets ordered by created_at DESC" do
      tweets = create_list(:tweet, 3)
      get :index
      expect(assigns(:tweets)).to match(tweets.sort{|a, b| b.created_at <=> 
      a.created_at })
    end
  
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

end