class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes

    get '/bakeries' do
      bakeries = Bakery.all
      bakeries.to_json
    end

    get '/bakeries/:id' do
      # look up the game in the database using its ID
      bakery = Bakery.find(params[:id])
      # send a JSON-formatted response of the game data
      bakery.to_json(include: :baked_goods)
    end

    get '/baked_goods/by_price' do
      BakedGood.order(price: :desc).to_json
    end
    get '/baked_goods/most_expensive' do
      BakedGood.order(price: :desc).limit(1)[0].to_json
    end

end
