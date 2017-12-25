captcha = File.read("input.txt")

answer1, answer2 = 0, 0

for i in 0..captcha.length
	answer1 += captcha[i].to_i if captcha[i] == captcha[i + 1]
end

p "answer1 = #{answer1}"

step = captcha.length / 2

for i in 0...step
	answer2 += captcha[i].to_i if captcha[i] == captcha[i + step]
end

answer2 *= 2

p "answer2 = #{answer2}"
 
