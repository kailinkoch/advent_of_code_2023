### A Pluto.jl notebook ###
# v0.19.32

using Markdown
using InteractiveUtils

# ╔═╡ f454c5d4-90c3-11ee-0411-ad4eb7898db3
# advent of code, day 1

# ╔═╡ 56a33c49-d5e3-4617-b902-05fe0af0fe08
input = readlines("inputs/day_01.txt")

# ╔═╡ 4bf92356-7b68-46cb-afaf-42fae3841947
function day1_part1(input)
	"
	Create a string number of the first and last digits in the sequence, and return the sum. In case of one number, the string number is the that number repeated.
	"
	local total = 0
	for i in input
		numbers = filter(isdigit, collect(i))
		if length(numbers) == 1
			number = numbers[1] * numbers[1]
			total += parse(Int64, number)  
		else
			number = numbers[1] * last(numbers)
			total += parse(Int64, number)
			
		end
	end
	return total
end


# ╔═╡ 8c474320-2b84-450f-9c83-c570b81dea9b
day1_part1(input)

# ╔═╡ f62a7f01-37bb-447b-ab95-a8db92108384
 digit_dict=Dict(
	"one" => 1,
	"two" => 2,
	"three" => 3,
	"four" => 4,
	"five" => 5,
	"six" => 6,
	"seven" => 7,
	"eight" => 8,
	"nine" => 9
)

# ╔═╡ d3f7415e-c91e-49ed-9918-b5a1f1f52f03
function day1_part2(input)
	"
	Finding the first and last written number in each string.
	Saving index and number.
	
	Next, find the first and last digit number in each string. If smaller or greater than written, replace.

	Calculate calibration number and add to total.

	Return total.
	"
	total = 0
	for i in input
		first_val = 10000
		last_val = 0
		first_number = 0
		last_number = 0

		# find first and last written number in string
		for key in keys(digit_dict)
			if occursin(key,i)
				first_index = findfirst(key, i)[1]
				last_index = findlast(key, i)[1]
				if isless(first_index, first_val)
					first_val = first_index
					first_number = digit_dict[key]
				end
				if last_index > last_val
					last_val = last_index
					last_number = digit_dict[key]
				end
			end
		end

		# replace first and last written number if digit number comes before/after
		numbers = filter(isdigit, collect(i))
		first_n = parse(Int64, numbers[1])
		first_n_index = findfirst(numbers[1], i)
		last_n = parse(Int64, last(numbers))
		last_n_index = findlast(last(numbers), i)
		
		if isless(first_n_index, first_val)
			first_number = first_n
		end
		if last_n_index > last_val
			last_number = last_n
		end

		# create combined calibration number
		first_str = string(first_number)
		last_str = string(last_number)
		final_num = first_str * last_str
		total += parse(Int64, final_num)
	end
	return total
end

# ╔═╡ 8b41bf3d-4846-43d0-97b8-bf3ce6f2b809
day1_part2(input)

# ╔═╡ Cell order:
# ╠═f454c5d4-90c3-11ee-0411-ad4eb7898db3
# ╠═56a33c49-d5e3-4617-b902-05fe0af0fe08
# ╠═4bf92356-7b68-46cb-afaf-42fae3841947
# ╠═8c474320-2b84-450f-9c83-c570b81dea9b
# ╠═f62a7f01-37bb-447b-ab95-a8db92108384
# ╠═d3f7415e-c91e-49ed-9918-b5a1f1f52f03
# ╠═8b41bf3d-4846-43d0-97b8-bf3ce6f2b809
