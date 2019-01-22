require_relative 'config/environment'

class App < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
  end

  get '/' do
    @session = session
    erb :index
  end

  post '/checkout' do
    session[:item] = params[:item]
    session[:cart] ||= []
    session[:cart] << params[:item]
    @session = session
    redirect to "/"
  end
end
