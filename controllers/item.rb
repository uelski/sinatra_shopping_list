class TaskController < ApplicationController

get '/' do
  @items = Item.all

  erb :read
end
get '/create' do

  erb :create
end
post '/create' do

  @item = Item.new
  @item.name = params[:name]
  @item.quantity = params[:quantity]
  @item.save

  @message = 'Your item was added!'
  erb :message
end

get '/update/:id' do
  @item = Item.find(params[:id])
  @item.id

  erb :update
end
post '/update' do

  @item = Item.find(params[:id])
  @item.name = params[:name]
  @item.quantity = params[:quantity]
  @item.save

  @message = 'Your item was updated!'
  erb :message
end
get '/destroy/:id' do
  @item = Item.find(params[:id])
  @item.id = params[:id]
  @item.name = params[:name]

  erb :destroy
end
post '/destroy' do
  @item = Item.find(params[:id])

  @item.destroy

  @message = 'You successfully removed your item!'
  erb :message
end


end
