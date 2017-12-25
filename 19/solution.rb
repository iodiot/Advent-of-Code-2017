class Diagram
	def initialize
		@map = File.open("input.txt", "r").readlines
	end

	def letter?(lookAhead)
  	lookAhead =~ /[[:alpha:]]/
	end

	def get(x, y)
		(x < 0 or y < 0 or x >= @map[0].length or y >= @map.length) ? " " : @map[y][x]
	end

	def get_start
		for x in 0...@map[0].length
			return [x, 0] if get(x, 0) == "|"
		end
		[-1, -1]
	end

	def track
		path = ""
		steps = 0
		x, y = get_start
		dx, dy = 0, 1

		while true 
			steps += 1

			x += dx
			y += dy

			v = get(x, y)

			break if v == " "

			path += v if letter?(v)
			
			# turn
			if v == "+"
				if dx != 0
					dx = 0
					dy = (get(x, y - 1) != " ") ? -1 : 1
				else
					dx = (get(x - 1, y) != " ") ? -1 : 1
					dy = 0
				end
			end

		end
		[path, steps]
	end
end

p Diagram.new.track

