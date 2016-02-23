# how many ways can you sum to 200 if your denominations are:
# => 1, 2, 5, 10, 20, 50, 100, and 200?

# 0, 1, 2: 100s

# 0, 1, 2, 3, 4: 50s

# 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10: 20s

# 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
# => 11, 12, 13, 14, 15, 16, 17, 18, 19, 20: 10s

# 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
# => 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
# => 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
# => 31, 32, 33, 34, 35, 36, 37, 38, 39, 40: 5s

# 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
# => 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
# => 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
# => 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
# => 41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
# => 51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
# => 61, 62, 63, 64, 65, 66, 67, 68, 69, 70,
# => 71, 72, 73, 74, 75, 76, 77, 78, 79, 80
# => 81, 82, 83, 84, 85, 86, 87, 88, 89, 90,
# => 91, 92, 93, 94, 95, 96, 97, 98, 99, 100: 2s

# (0..200): 1s

def equals200?(two_pound, one_pound, fifty_pence, twenty_pence,
               ten_pence, five_pence, two_pence, one_pence)
  #p two_pound, one_pound, fifty_pence, twenty_pence, ten_pence, five_pence, two_pence, one_pence
  return 200 == 200*two_pound + 100*one_pound + 50*fifty_pence +
  20*twenty_pence + 10*ten_pence + 5*five_pence + 2*two_pence + one_pence
end

target = 200
ways = 0

target.step(0,-200) do |two_pound|
  two_pound.step(0,-100) do |one_pound|
    one_pound.step(0,-50) do |fifty_pence|
      fifty_pence.step(0,-20) do |twenty_pence|
        twenty_pence.step(0,-10) do |ten_pence|
          ten_pence.step(0,-5) do |five_pence|
            five_pence.step(0,-2) do |two_pence|
              ways += 1
            end
          end
        end
      end
    end
  end
end

p ways
