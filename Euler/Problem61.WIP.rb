def oct_gen(min, max)
  arr = []
  n = 1
  loop do
    num = n*((3*n)-2)
    break if num >= max
    arr << num if num > min
    n += 1
  end
  return arr
end

def hep_gen(min, max)
  arr = []
  n = 1
  loop do
    num = n*((5*n)-3)/2
    break if num >= max
    arr << num if num > min
    n += 1
  end
  return arr
end

def hex_gen(min, max)
  arr = []
  n = 1
  loop do
    num = n*((2*n)-1)
    break if num >= max
    arr << num if num > min
    n += 1
  end
  return arr
end

def pen_gen(min, max)
  arr = []
  n = 1
  loop do
    num = n*((3*n)-1)/2
    break if num >= max
    arr << num if num > min
    n += 1
  end
  return arr
end

def sq_gen(min, max)
  arr = []
  n = 1
  loop do
    num = n**2
    break if num >= max
    arr << num if num > min
    n += 1
  end
  return arr
end

def tri_gen(min, max)
  arr = []
  n = 1
  loop do
    num = n*(n+1)/2
    break if num >= max
    arr << num if num > min
    n += 1
  end
  return arr
end

def neighbor_gen(octs,heps,hexs,pens,sqs,tris,current)
  sets = []
  current.each do |curr|
    set = [[curr]]
    if current != octs
      octs.each do |oct|
        set << [oct,'oct'] if curr.to_s[2..-1] == oct.to_s[0..1]
      end
    end
    if current != heps
      heps.each do |hep|
        set << [hep,'hep'] if curr.to_s[2..-1] == hep.to_s[0..1]
      end
    end
    if current != hexs
      hexs.each do |hex|
        set << [hex,'hex'] if curr.to_s[2..-1] == hex.to_s[0..1]
      end
    end
    if current != pens
      pens.each do |pen|
        set << [pen,'pen'] if curr.to_s[2..-1] == pen.to_s[0..1]
      end
    end
    if current != sqs
      sqs.each do |sq|
        set << [sq,'sq'] if curr.to_s[2..-1] == sq.to_s[0..1]
      end
    end
    if current != tris
      tris.each do |tri|
        set << [tri,'tri'] if curr.to_s[2..-1] == tri.to_s[0..1]
      end
    end
    sets << set if set.size > 1
  end
  return sets
end

def check_other_sets(num,sets)
  sets.each do |set|
    if num == set[0][0]
      return true
    end
  end
  return false
end

def cancel_sets(octs,heps,hexs,pens,sqs,tris,current)
  new_sets = []
  current.each do |set|
    (1...set.size).each do |next_set|
      check_set = "def"
      check_num = 0
      if set[next_set] != nil
        check_set = set[next_set][1]
        check_num = set[next_set][0]
      end
      case check_set
      when "oct"
        set.delete(set[next_set]) unless check_other_sets(check_num,octs)
      when "hep"
        set.delete(set[next_set]) unless check_other_sets(check_num,heps)
      when "hex"
        set.delete(set[next_set]) unless check_other_sets(check_num,hexs)
      when "pen"
        set.delete(set[next_set]) unless check_other_sets(check_num,pens)
      when "sq"
        set.delete(set[next_set]) unless check_other_sets(check_num,sqs)
      when "tri"
        set.delete(set[next_set]) unless check_other_sets(check_num,tris)
      when "def"
        break
      end
    end
    new_sets << set if set.size > 1
  end
  return new_sets
end

octs = oct_gen(1000,10000)
heps = hep_gen(1000,10000)
hexs = hex_gen(1000,10000)
pens = pen_gen(1000,10000)
sqs = sq_gen(1000,10000)
tris = tri_gen(1000,10000)

#p octs, heps, hexs, pens, sqs, tris

oct_sets = neighbor_gen(octs,heps,hexs,pens,sqs,tris,octs)
hep_sets = neighbor_gen(octs,heps,hexs,pens,sqs,tris,heps)
hex_sets = neighbor_gen(octs,heps,hexs,pens,sqs,tris,hexs)
pen_sets = neighbor_gen(octs,heps,hexs,pens,sqs,tris,pens)
sq_sets = neighbor_gen(octs,heps,hexs,pens,sqs,tris,sqs)
tri_sets = neighbor_gen(octs,heps,hexs,pens,sqs,tris,tris)

#=begin
p oct_sets.size
p hep_sets.size
p hex_sets.size
p pen_sets.size
p sq_sets.size
p tri_sets.size
puts
#=end

oct_sets = cancel_sets(oct_sets,hep_sets,hex_sets,pen_sets,sq_sets,tri_sets,oct_sets)
hep_sets = cancel_sets(oct_sets,hep_sets,hex_sets,pen_sets,sq_sets,tri_sets,hep_sets)
hex_sets = cancel_sets(oct_sets,hep_sets,hex_sets,pen_sets,sq_sets,tri_sets,hex_sets)
pen_sets = cancel_sets(oct_sets,hep_sets,hex_sets,pen_sets,sq_sets,tri_sets,pen_sets)
sq_sets = cancel_sets(oct_sets,hep_sets,hex_sets,pen_sets,sq_sets,tri_sets,sq_sets)
tri_sets = cancel_sets(oct_sets,hep_sets,hex_sets,pen_sets,sq_sets,tri_sets,tri_sets)

p oct_sets.size
p hep_sets.size
p hex_sets.size
p pen_sets.size
p sq_sets.size
p tri_sets.size
puts

oct_sets = cancel_sets(oct_sets,hep_sets,hex_sets,pen_sets,sq_sets,tri_sets,oct_sets)
hep_sets = cancel_sets(oct_sets,hep_sets,hex_sets,pen_sets,sq_sets,tri_sets,hep_sets)
hex_sets = cancel_sets(oct_sets,hep_sets,hex_sets,pen_sets,sq_sets,tri_sets,hex_sets)
pen_sets = cancel_sets(oct_sets,hep_sets,hex_sets,pen_sets,sq_sets,tri_sets,pen_sets)
sq_sets = cancel_sets(oct_sets,hep_sets,hex_sets,pen_sets,sq_sets,tri_sets,sq_sets)
tri_sets = cancel_sets(oct_sets,hep_sets,hex_sets,pen_sets,sq_sets,tri_sets,tri_sets)

p oct_sets
p hep_sets.size
p hex_sets.size
p pen_sets.size
p sq_sets.size
p tri_sets.size
