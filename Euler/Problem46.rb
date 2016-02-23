require "prime.rb"

max = 10000

odd_comps = []
(35..max).step(2) do |num|
  odd_comps << num if Prime.prime?(num) == false
end

#p odd_comps

vals = []
golds = []
odd_comps.each do |odd_comp|
  breakCheck = false
  Prime.reverse_each(odd_comp) do |prime|
    if odd_comp-prime > 1
      val = Math.sqrt((odd_comp-prime)/2.0)
      breakCheck = true if val % 1 == 0
      #p "#{odd_comp} = #{prime} + 2*#{val}^2" if breakCheck == true
      break if breakCheck == true
    end
  end
  golds << odd_comp if breakCheck == false
end

p golds
