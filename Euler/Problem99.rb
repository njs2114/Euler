file = File.open("input_files/p099_base_exp.txt", "r")
arr = file.readlines[0..file.size]

nums = []
arr.each do |entry|
  entry = entry[0...-1]
  nums << entry.split(',')
end

prods = []
nums.each do |num|
  base = Math.log(num[0].to_i)
  exp = num[1].to_i
  prods << base*exp
end

p prods.index(prods.max) + 1
