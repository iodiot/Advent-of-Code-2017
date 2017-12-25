input = "stpzcrnm"
#input = "flqrgnkx"

def compute_knot_hash(input)
	list = Array.new(256) {|x| x}
	suffix = [17, 31, 73, 47, 23]
	sequence = input.codepoints.to_a + suffix

	def run_rounds(list, sequence)
		pos, skip = 0, 0
		64.times {
			sequence.each do |seq|
			  a = []
			  seq.times {|i| a << list[(i + pos) % list.count]}
			  seq.times {|i| list[(i + pos) % list.count] = a.reverse[i]}

				pos += seq + skip
				skip += 1
			end
		}
		list
	end

	sparse_hash = run_rounds(list, sequence)

	dense_hash = sparse_hash.each_slice(16).to_a.map {|x| x.inject(0) {|xored, y| xored ^= y }}

	dense_hash.map {|x| "%08b" % x}.join
end

squares = 0
grid = []

(0..127).each do |i|
	grid << compute_knot_hash("#{input}-#{i}").each_char.map {|x| x == '1' ? '#' : '.'}
	squares += grid.last.count('#')
end

puts "answer1 = #{squares}"

def fill_region(grid, start_x, start_y)
	queue = [[start_x, start_y]]
	while not queue.empty?
		x, y = queue.shift
		next if x < 0 or x >= 128 or y < 0 or y >= 128 or grid[y][x] == '.'
		grid[y][x] = '.'
		queue.push [x - 1, y]
		queue.push [x + 1, y]
		queue.push [x, y - 1]
		queue.push [x, y + 1]
	end
end

regions = 0

for y in 0...128
	for x in 0...128
		if grid[y][x] == '#'
			regions += 1
			fill_region(grid, x, y)
		end
	end
end

puts "answer2 = #{regions}"
