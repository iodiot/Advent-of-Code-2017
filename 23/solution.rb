lines = File.readlines("input.txt")

pos = 0
registers = {}
count = 0

def letter?(lookAhead)
  lookAhead =~ /[[:alpha:]]/
end

('a'.ord..'h'.ord).each {|x| registers[x.chr] = 0}

registers['a'] = 1
registers['b'] = 108400
registers['c'] = 125400

n = 0

while pos < lines.count do
	cmd, x, y = lines[pos].chomp.split(" ")

	y = letter?(y) ? registers[y] : y.to_i

	case cmd
	when "set"
		registers[x] = y
	when "sub"
		registers[x] -= y
	when "mul"
		registers[x] *= y
		count += 1
	when "jnz"	
		v = letter?(x) ? registers[x] : x.to_i
		pos += y if v != 0
		next if v != 0
	end

	pos += 1
	p registers
	n += 1
end

puts "answer1 = #{count}"
puts "answer2 = #{registers['h']}"