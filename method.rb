

class Split

	def self.divide_by_team(group_array, divide_by_num)

		num_per_team = (group_array.length / divide_by_num.to_f)

		if(group_array.length % divide_by_num != 0)

			team_array = group_array.each_slice( num_per_team ).to_a
			
			correct_teams = team_array[0..divide_by_num - 1]
			left_over = team_array[divide_by_num..team_array.length].flatten	
			
			i = 0

			left_over.size.times do
				correct_teams[i] << left_over.pop
				i += 1
			end

			correct_teams

		else

			group_array.each_slice( num_per_team ).to_a

		end	

	end # Ed divide_by_team



	def self.num_per_team(group_array, divide_by_num)

		
		if(group_array.length % divide_by_num != 0)

			num_of_teams = (group_array.length / divide_by_num.to_f).ceil #2
			final_teams = (divide_by_num / num_of_teams) #3

		  team_array = group_array.each_slice(final_teams).to_a

		  correct_teams = team_array[0, team_array.length - 1]
			left_over = team_array.last.flatten	
			
			i = 0

			left_over.size.times do
				correct_teams[i] << left_over.pop
				i += 1
			end

			correct_teams

		else 

			group_array.each_slice( divide_by_num ).to_a

		end	

	end # End num_per_team


end

