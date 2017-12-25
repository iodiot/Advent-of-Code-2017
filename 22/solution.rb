map = {}

lines = File.open("input.txt", "r").readlines

lines.each_with_index do |line, j|
	line.chomp.chars.each_with_index {|ch, i| map[[i, j].to_s] = ch}
end

n = lines.length / 2 
x, y = n, n

dirs = [[0, -1], [1, 0], [0, 1], [-1, 0]]

def first(map, dirs, x, y)
	d = 0
	caused = 0

	10000.times do 
		h = [x, y].to_s

		if map[h] == '#'
			map[h] = '.'
			d = (d + 1) % 4
		else
			map[h] = '#'
			caused += 1
			d = (d - 1) % 4
		end

		x += dirs[d][0]
		y += dirs[d][1]
	end

	caused
end

def second(map, dirs, x, y)
	d = 0
	caused = 0

	10000000.times do 
		p = [x, y].to_s
		node = map.include?(p) ? map[p] : '.'

		if node == '#'
			map[p] = 'F'
			d = (d + 1) % 4
		elsif node == 'F'
			map[p] = '.'
			d = (d + 2) % 4
		elsif node == 'W'
			map[p] = '#'
			caused += 1
		else 
			map[p] = 'W'
			d = (d - 1) % 4
		end

		x += dirs[d][0]
		y += dirs[d][1]
	end

	caused
end

puts "asnwer1 = #{first(map, dirs, x, y)}" 
puts "asnwer2 = #{second(map, dirs, x, y)}" 