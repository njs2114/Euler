def factorial(num)
  prod = 1
  num.downto(2) { |val| prod *= val }
  return prod
end

def nCr(n, r)
  return factorial(n)/(factorial(r)*factorial(n-r))
end

#p nCr 5, 3
#p nCr 23, 10

choices = []
(1..100).each do |n|
  (1...n).each do |r|
    choice = nCr(n,r)
    choices << choice if choice > 1_000_000
  end
end

p choices.count
