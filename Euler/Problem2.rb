max_fib = 4_000_000

fib1 = 1
fib2 = 1
sum = 0

loop do
  if fib2 >= max_fib
    break
  end
  if fib2 % 2 == 0
    sum += fib2
  end
  temp = fib2
  fib2 += fib1
  fib1 = temp
end

p sum
