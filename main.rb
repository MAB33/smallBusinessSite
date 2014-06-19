require 'sinatra'
require 'mandrill'

get '/' do
	erb :index
end

get '/collections' do
	erb :collections
end

get '/contact' do
	erb :contact
end

