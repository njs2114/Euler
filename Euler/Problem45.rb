def triangle_gen(max)
  nums = []
  n = 1
  loop do
    num = n*(n+1)/2
    break if num >= max
    nums << num
    n += 1
  end
  return nums
end

def pentagonal_gen(max)
  nums = []
  n = 1
  loop do
    num = n*(3*n-1)/2
    break if num >= max
    nums << num
    n += 1
  end
  return nums
end

def hexagonal_gen(max)
  nums = []
  n = 1
  loop do
    num = n*(2*n-1)
    break if num >= max
    nums << num
    n += 1
  end
  return nums
end

def triangular?(num, tri_array)
  tri_array.include?(num)
end

def pentagonal?(num, pen_array)
  pen_array.include?(num)
end

def hexagonal?(num, hex_array)
  hex_array.include?(num)
end

tris = triangle_gen(2_000_000_000)
pens = pentagonal_gen(2_000_000_000)
hexas = hexagonal_gen(2_000_000_000)

tris.each do |tri|
  p tri if pentagonal?(tri, pens) & hexagonal?(tri, hexas)
end
