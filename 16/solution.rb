moves = File.open("input.txt", "r").read.split(",")

period = 60

def dance(moves, n)
	programs = (0...16).map {|x| ('a'.ord + x).chr}

	n.times do |i|
		moves.each do |move|
			case move[0]
			when "s"
				x = move[1..-1].to_i
				programs.rotate! -x
			when "x"
				a, b = move.scan(/\d+/).map {|x| x.to_i}
				t = programs[a]
				programs[a] = programs[b]
				programs[b] = t
			when "p"
				a, b = move[1..-1].split("/").map {|x| programs.index x}
				t = programs[a]
				programs[a] = programs[b]
				programs[b] = t	
			end
		end
	end

	programs.join
end

puts "answer1 = #{dance(moves, 1)}"
puts "answer2 = #{dance(moves, 1000000000 % period)}"