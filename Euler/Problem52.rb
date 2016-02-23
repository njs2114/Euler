def same_digits?(num1, num2)
  a_num1 = []
  a_num2 = []
  num1.to_s.each_char { |char| a_num1 << char }
  num2.to_s.each_char { |char| a_num2 << char }
  return a_num1.sort == a_num2.sort
end

num = 1
loop do
  if same_digits?(num, num*2)
    if same_digits?(num, num*3)
      if same_digits?(num, num*4)
        if same_digits?(num, num*5)
          if same_digits?(num, num*6)
            p "#{num}, #{num*2}, #{num*3}, #{num*4}, #{num*5}, #{num*6}"
            break
          end
        end
      end
    end
  end
  num += 1
end
