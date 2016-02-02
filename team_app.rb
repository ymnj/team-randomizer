require 'sinatra'
require 'sinatra/reloader'
require './method.rb'

enable :sessions


get '/teampicker' do 

	erb :team_picker, layout: :app_layout

end


post '/teampicker' do 


	session[:arr_of_names] = params[:list].split( /,\s*/ )
	#returns an array of names split/shuffled
	session[:string_of_names] = session[:arr_of_names].join(", ")

	session[:method] = params[:method]	##divide by team or individials per team
	session[:number] = params[:number].to_i #number to be divided by

	if(session[:method] == "num_of_team")

		session[:result] = Split.divide_by_team(session[:arr_of_names].shuffle, session[:number])

	else (session[:method] == "num_per_team")

		session[:result] = Split.num_per_team(session[:arr_of_names].shuffle, session[:number])

	end

	p session[:result]
	p session[:string_of_names]
	
	erb :team_picker, layout: :app_layout

end