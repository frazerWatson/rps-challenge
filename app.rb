require 'sinatra/base'

class RPS < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
    session[:player_name] = params[:name]
    redirect '/play'
  end

  get '/play' do
    @turn = Turn.new(session)
    erb :play
  end

  post '/play' do 
    session[:player_weapon] = params[:weapon]
    session[:opponent_weapon] = Opponent.new.weapon
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
