def c_to_i(c)
  case c
  when 'a', 'A'
    return 1
  when 'b', 'B'
    return 2
  when 'c', 'C'
    return 3
  when 'd', 'D'
    return 4
  when 'e', 'E'
    return 5
  when 'f', 'F'
    return 6
  when 'g', 'G'
    return 7
  when 'h', 'H'
    return 8
  when 'i', 'I'
    return 9
  when 'j', 'J'
    return 10
  when 'k', 'K'
    return 11
  when 'l', 'L'
    return 12
  when 'm', 'M'
    return 13
  when 'n', 'N'
    return 14
  when 'o', 'O'
    return 15
  when 'p', 'P'
    return 16
  when 'q', 'Q'
    return 17
  when 'r', 'R'
    return 18
  when 's', 'S'
    return 19
  when 't', 'T'
    return 20
  when 'u', 'U'
    return 21
  when 'v', 'V'
    return 22
  when 'w', 'W'
    return 23
  when 'x', 'X'
    return 24
  when 'y', 'Y'
    return 25
  when 'z', 'Z'
    return 26
  end
end

def word_score(word)
  score = 0
  word.each_char do |char|
    score += c_to_i char
  end
  return score
end

def tri_num_gen(max)
  tri_nums = []
  num = 0
  addend = 1
  loop do
    break if (num + addend) > max
    tri_nums << num += addend
    addend += 1
  end
  return tri_nums
end

file = File.open("input_files/p042_words.txt", "r")
arr = file.read.split(",")
newArr = []
arr.each { |word| newArr << word[1..word.size-2] } #.downcase
tri_nums = tri_num_gen(10_000)

scores = []
newArr.each do |word|
  score = word_score(word)
  scores << score if tri_nums.include?(score)
end

p scores.size
