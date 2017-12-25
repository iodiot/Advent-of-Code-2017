b = 108400
c = 125400
h = 0

def prime?(n)
  return false if n < 2 
  return true if n == 3 || n == 2 
    if (2...n-1).any?{|i| n % i == 0}
      false
    else
      true
    end
end

while true
	f = prime?(b) ? 1 : 0
	h += 1 if f == 0
	break if b == c
	b += 17
end

puts "answer2 = #{h}"