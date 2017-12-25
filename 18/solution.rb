lines = File.readlines("input.txt")

pos = 0
last_freq = -1
rcv_freq = -1
registers = {}

def letter?(lookAhead)
  lookAhead =~ /[[:alpha:]]/
end

while pos < lines.count do
	cmd, x, y = lines[pos].chomp.split(" ")

	registers[x] = 0 unless registers.include?(x)

	unless y.nil?
		registers[y] = 0 if letter?(y) and not registers.include?(y)
		y = letter?(y) ? registers[y] : y.to_i
	end 

	case cmd
	when "snd"
		last_freq = registers[x]
	when "set"
		registers[x] = y
	when "add"
		registers[x] += y
	when "mul"
		registers[x] *= y
	when "mod"
		registers[x] %= y
	when "rcv"
		rcv_freq = last_freq if registers[x] != 0
		break if registers[x] != 0
	when "jgz"	
		pos += y if registers[x] > 0
		next if registers[x] > 0
	end

	pos += 1
end

puts "answer1 = #{rcv_freq}"