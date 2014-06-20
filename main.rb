require 'sinatra'
require 'mandrill'

def send_message(senderName, senderEmail, message)
	m = Mandrill::API.new
	message = {  
	 :subject=> "Comments/Questions",  
	 :from_name=> senderName,  
	 :text=> message,  
	 :to=>[  
	   {  
	     :email=>"melissavlin@gmail.com",
	     :name=> "Melissa Lin"  
	   }  
	 ],  
	 :html=>"<html><body style='font-family:Arial;font-size:12px'> #{message}</html>",  
	 :from_email=> senderEmail 
	}  
	sending = m.messages.send message
	# message.send is a method that the mandrill API made. so it is specific to mandrill. directions/specifications must be read in their documentation
	puts sending 
	# do not need puts sending - this only puts the message into the console
end

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

post '/submit-form' do
	send_message(params[:senderName], params[:senderEmail], params[:message])
	redirect to('/')
end