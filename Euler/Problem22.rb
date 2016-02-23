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

file = File.open("input_files/p022_names.txt", "r")
arr = file.read.split(",")
newArr = []
#p arr[0][1..arr[0].size-2]
arr.each { |name| newArr << name[1..name.size-2] } #.downcase
newArr.sort!

#p newArr[0]
#newArr[0].each_char { |char| sum += c_to_i char }
#p sum

index = 1
sumOfSums = 0
newArr.each do |name|
  sum = 0
  name.each_char do |char|
    sum += c_to_i char
  end
  sumOfSums += sum*index
  index += 1
end

p sumOfSums
