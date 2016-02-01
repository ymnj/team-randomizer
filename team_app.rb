require 'sinatra'
require 'sinatra/reloader'
require './method.rb'



get '/teampicker' do 

	erb :team_picker, layout: :app_layout

end


post '/teampicker' do 

	@name_list = params[:list]
	@arr_of_names = @name_list.split( /,\s*/ )
	#returns an array of names split/shuffled

	@method = params[:method]	##divide by team or individials per team
	@number = params[:number].to_i #number to be divided by

	if(@method == "num_of_team")

		@result = Split.divide_by_team(@arr_of_names.shuffle, @number)

	else (@method == "num_per_team")

		@result = Split.num_per_team(@arr_of_names.shuffle, @number)

	end

	p @result
	
	erb :team_picker, layout: :app_layout

end