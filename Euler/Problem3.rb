require "prime.rb"

num = 600851475143
maxVal = 0
val = 1

loop do
  if num % val == 0
    if Prime.prime?(val)
      if val > maxVal
        num /= val
        maxVal = val
      end
    end
  end
  val += 1
  if val> num
    break
  end
end

p maxVal
