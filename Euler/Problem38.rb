num = "987654321"
max = 918273645

perms = num.split('').permutation.to_a
large_perms = []
perms.each do |perm|
  large_perms << perm.join.to_i if perm.join.to_i > max
end

pans = []
large_perms.each do |perm|
  p1 = perm.to_s[0..3].to_i
  p2 = perm.to_s[4..8].to_i
  if (p2 == (p1*2))
    pans << "#{p1}#{p2}".to_i
  end
end

p pans.max
