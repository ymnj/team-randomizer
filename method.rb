

class Split


	def self.divide_by_team(group_array, divide_by_num)

		num_per_team = (group_array.length / divide_by_num.to_f)

		# If the number of individuals do not divide evenly by the desired number
		if(group_array.length % divide_by_num != 0)

	
			# This multi-array will contain one extra array with the left over individuals. Loop through this last array and push them into random "correct" arrays
			team_array = group_array.each_slice( num_per_team ).to_a
	
			# Split array into wanted number of arrays and leftover arrays
			correct_teams = team_array[0..divide_by_num - 1]
			left_over = team_array[divide_by_num..team_array.length].flatten
			

			# Loop through left over array and insert them into a loop of correct arrays
			i = 0

			left_over.size.times do
				correct_teams[i] << left_over.pop
				i += 1
			end

			correct_teams

		else # Teams will be divided evenly

			group_array.each_slice( num_per_team ).to_a

		end	

	end # Ed divide_by_team



	def self.num_per_team(group_array, divide_by_num)

		# If the number of individuals do not divide evenly by the desired number
		if(group_array.length % divide_by_num != 0)

			teams = []
			counter = 0
			mid = (group_array.length / divide_by_num)

			1.upto(divide_by_num) do
				|i|
				last = counter + mid
				last = last-1 unless group_array.length % divide_by_num >= i
				teams << group_array[counter..last] || []
				counter = last + 1

			end

			teams

		else # Teams will be divided evenly

			group_array.each_slice( divide_by_num ).to_a

		end	

	end # End num_per_team

end