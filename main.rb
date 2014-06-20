require 'sinatra'
require 'mandrill'

get '/' do
	erb :index
end

get '/collections' do
	@title = "Collections"
	erb :collections
end

get '/contact' do
	@title = "Contact"
	erb :contact
end

