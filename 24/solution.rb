def strength(bridge, components)
	s = 0 
	bridge.each do |i|
		s += components[i][0] + components[i][1]
	end
	s
end

def last_port(bridge, components)
	port = 0
	bridge.each do |i|
		c = components[i]
		port = (c[0] == port) ? c[1] : c[0]
	end
	port
end

components = File.open("input.txt", "r").readlines.map {|x| x.chomp.split("/").map{|x| x.to_i}.sort}
bridges = []

components.each_with_index {|c, i| bridges << [i] if c[0] == 0}

max_strength = 0
max_length = 0
max_strength_length = 0

while not bridges.empty?
	b = bridges.shift

	strength = strength(b, components)
	port = last_port(b, components)

	max_strength = strength if strength > max_strength

	if b.length > max_length
		max_length = b.length
		max_strength_length = 0
	end

	if (b.length == max_length)
		max_strength_length = strength if strength > max_strength_length
	end

	components.each_with_index do |c, i|
		if (not b.include?(i)) and c.include?(port)
			bridges << b + [i]
		end
	end	
end

puts "answer1 = #{max_strength}"
puts "answer2 = #{max_strength_length}"

