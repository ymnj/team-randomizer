require 'sinatra'
require './method.rb'

enable :sessions


get '/teampicker' do 

	erb :team_picker, layout: :app_layout

end


post '/teampicker' do 

	if (params[:number].to_i > params[:list].size) || (params[:number].to_i < 1)
		@error = "Please input a valid number greater than one and less than the number of individuals"
	else

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

	end

	erb :team_picker, layout: :app_layout

end