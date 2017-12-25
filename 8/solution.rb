answer1, answer2 = 0, 0

registers = {}

File.open("input.txt").each do |line|
	tokens = line.chomp.split(" ")
	
	r1, r2, v1, v2 = tokens[0], tokens[4], tokens[2].to_i, tokens[6].to_i

	v1 *= -1 if tokens[1] == 'dec'

	registers[r1] = 0 unless registers.include? r1
	registers[r2] = 0 unless registers.include? r2

	condition = false

	case tokens[5]
	when '<'
		condition = registers[r2] < v2
	when '<='
		condition = registers[r2] <= v2
	when '=='
		condition = registers[r2] == v2
	when '!='
		condition = registers[r2] != v2
	when '>'
		condition = registers[r2] > v2
	when '>='
		condition = registers[r2] >= v2
	end

	registers[r1] += v1 if condition
	answer2 = registers[r1] if registers[r1] > answer2 
end

answer1 = registers.values.max

p "answer1 = #{answer1}"
p "answer2 = #{answer2}"
 
