def read_block(lines, i)
	value = lines[i].scan(/\d+/)[0].to_i
	move = lines[i + 1].split(" ")[-1][0..-2]
	continue_with = lines[i + 2].split(" ")[-1][0]
	{:value => value, :move => move, :continue_with => continue_with}
end

lines = File.open("input.txt", "r").readlines.map {|line| line.chomp}

cur_state = lines[0].split(" ")[-1][0]
n = lines[1].scan(/\d+/)[0].to_i
states = {}

i = 3
while i < lines.length
	state = lines[i].split(" ")[-1][0]
	states[state] = {}
	states[state][0] = read_block(lines, i + 2)
	states[state][1] = read_block(lines, i + 6)

	i += 10
end

tape = {}
cursor = 0

while n > 0
	tape[cursor] = 0 unless tape.include?(cursor) 
	value = tape[cursor]
	z = states[cur_state][value]

	tape[cursor] = z[:value]
	cursor += (z[:move] == "left") ? -1 : 1
	cur_state = z[:continue_with]

	n -= 1
end

puts "answer1 = #{tape.values.count(1)}"
