class Grid 
	def initialize
		@grid = {}
		set(0, 0, 1)
	end

	def set(x, y, v)
		@grid[[x, y]] = v
	end

	def get(x, y)
		(@grid.include? [x, y]) ? @grid[[x, y]] : 0
	end

	def calc_sum(x, y)
		sum = 0
		for i in -1..1
			for j in -1..1
				sum += get(x + i, y + j)
			end
		end
		sum
	end
end


grid = Grid.new

n = 3
x, y = 1, 0
dirs = [[0, -1], [-1, 0], [0, 1], [1, 0]]

loop do 
	for i in 0...((n - 1) * 4)
		sum = grid.calc_sum(x, y)

		if sum > 265149
			puts "answer1 = #{sum}"
			p n
			p grid
			exit
		end
		
		grid.set(x, y, sum)

		if i < (n - 1) * 4 - 1
			dir = dirs[(i + 1) / (n - 1)]
		end

		x += dir[0]
		y += dir[1]
	end

	n += 2
end

