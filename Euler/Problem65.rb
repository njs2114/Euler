mult = 2
last_num = 1
last_den = 0
curr_num = 2
curr_den = 1
num = 0

(0...100).each do |count|
  index = count % 3
  num = curr_num

  temp_num = curr_num
  temp_den = curr_den

  if index == 1
    curr_num = last_num + curr_num*mult
    curr_den = last_den + curr_den*mult
    mult += 2
  else
    curr_num += last_num
    curr_den += last_den
  end

  last_num = temp_num
  last_den = temp_den

end

sum = 0
num.to_s.split('').each { |digit| sum += digit.to_i}
p sum
