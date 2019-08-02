require_relative 'config/environment'

class App < Sinatra::Base

	configure do
  		enable :sessions
  		set :session_secret, "secret"
	end

	get "/" do

		@item = session[:item]

		erb :index
	end

	post "/checkout" do 

		session["item"] = params[:item]
		
		redirect "/"

	end



end