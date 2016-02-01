require 'sinatra'
require 'sinatra/reloader'
require './method.rb'



get '/teampicker' do 

	erb :team_picker, layout: :app_layout

end


post '/teampicker' do 

	@arr_of_names = params[:list].split( /,\s*/ ).shuffle
	#returns an array of names split/shuffled

	@method = params[:method]	##divide by team or individials per team
	@number = params[:number].to_i #number to be divided by

	#@total_individuals = @list_of_names.length

	if(@method == "num_of_team")
		@result = Split.divide_by_team(@arr_of_names, @number)

	else (@method == "num_per_team")
		@result = Split.numPerTeam(@arr_of_names, @number)
	end

	p @result
	
	erb :team_picker, layout: :app_layout

end