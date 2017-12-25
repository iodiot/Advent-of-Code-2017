class Program 
	def initialize(p, this_queue, other_queue)
		@lines = File.readlines("input.txt")
		@pos = 0
		@registers = {"p" => p}
		@this_queue = this_queue
		@other_queue = other_queue
		@sent_times = 0
	end

	def letter?(lookAhead)
  	lookAhead =~ /[[:alpha:]]/
	end

	def sent_times
		@sent_times
	end

	def run
		while @pos < @lines.count do
			cmd, x, y = @lines[@pos].chomp.split(" ")

			y = letter?(y) ? @registers[y] : y.to_i unless y.nil?

			case cmd
			when "snd"
				@other_queue << @registers[x]
				@sent_times += 1
			when "set"
				@registers[x] = y
			when "add"
				@registers[x] += y
			when "mul"
				@registers[x] *= y
			when "mod"
				@registers[x] %= y
			when "rcv"
				return if @this_queue.empty?
				@registers[x] = @this_queue.shift
			when "jgz"	
				v = letter?(x) ? @registers[x] : x.to_i
				@pos += y if v > 0
				next if v > 0
			end

			@pos += 1
		end
	end
end

q0, q1 = [], []
p0, p1 = Program.new(0, q0, q1), Program.new(1, q1, q0)

while true
	p0.run
	p1.run
	break if q0.empty? and q1.empty? # deadlock
end

puts "answer2 = #{p1.sent_times}"

