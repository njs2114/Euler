max_fib_digs = 1000

fib1 = 1
fib2 = 1
index = 2

loop do
  if fib2.to_s.size >= max_fib_digs
    break
  end
  index += 1
  temp = fib2
  fib2 += fib1
  fib1 = temp
end

p index
