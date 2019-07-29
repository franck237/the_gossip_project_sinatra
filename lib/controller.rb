require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get'/gossips/new/' do
  	erb :new_gossip
  end

  post '/gossips/new/' do
	Gossip.new(params["gossip_author"],params["gossip_content"]).save
	redirect '/'
  end

  get '/gossips/:id/' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  erb :show, locals: {gossip_used: Gossip.find(params['id'])}
	#return gossip_id = params['id']
  end

  get '/gossips/:id/edit' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  erb :edit, locals: {gossip_used: Gossip.find(params['id'])}
  end

  post '/gossips/:id/edit' do
  	#params['id']
	Gossip.new(params["gossip_author"],params["gossip_content"]).save
  	
  end

end