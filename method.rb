

class Split


	def self.divide_by_team(group_array, divide_by_num)

		num_per_team = (group_array.length / divide_by_num.to_f)

		# If the number of individuals do not divide evenly by the desired number
		if(group_array.length % divide_by_num != 0)

			team_array = group_array.each_slice( num_per_team ).to_a
			# [one, two, three, four, five, six, seven, eight, nine, ten]
			# 
			# This multi-array will contain one extra array with the left over individuals. Loop through this last array and push them into random "correct" arrays
			# 
			
			correct_teams = team_array[0..divide_by_num - 1]
			#[["one"], ["two"], ["three"], ["four"], ["five"], ["six"], ["seven"]]
			left_over = team_array[divide_by_num..team_array.length].flatten
			#[["eight"], ["nine"], ["ten"]]

			i = 0
			
			left_over.size.times do

				correct_teams[i] << left_over.pop
				i += 1

			end

			correct_teams

		else # Teams will be divided evenly

			group_array.each_slice( num_per_team ).to_a

		end	

	end



	def self.numPerTeam(group_array, divide_by_num)

		# if(numOfIndividuals / number != 0)

		# else

		# end	


	end

end