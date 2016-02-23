def rom_to_i(rom)
  roman = rom.dup

  if roman.include?('IIII')
    roman = roman.sub('IIII','IV')
    if roman.include?('VIV')
      roman = roman.sub('VIV','IX')
    end
  end
  if roman.include?('XXXX')
    roman = roman.sub('XXXX','XL')
    if roman.include?('LXL')
      roman = roman.sub('LXL','XC')
    end
  end
  if roman.include?('CCCC')
    roman = roman.sub('CCCC','CD')
    if roman.include?('DCD')
      roman = roman.sub('DCD','CM')
    end
  end

  iv = roman.scan('IV').length
  ix = roman.scan('IX').length
  i = roman.count('I') - iv - ix
  v = roman.count('V') - iv
  xl = roman.scan('XL').length
  xc = roman.scan('XC').length
  x = roman.count('X') - xl - xc - ix
  l = roman.count('L') - xl
  cd = roman.scan('CD').length
  cm = roman.scan('CM').length
  c = roman.count('C') - cd - cm - xc
  d = roman.count('D') - cd
  m = roman.count('M') - cm

  val = m*1000 + d*500 + c*100 + cm*900 + cd*400 + l*50 + x*10 + xc*90 + xl*40 + v*5 + i + ix*9 + iv*4

  return roman, val
end

file = File.open("input_files/p089_roman.txt", "r")
arr = file.readlines[0..file.size]

romans = []
arr.each { |roman| romans << roman.strip }

p rom_to_i(ARGV[0]) if ARGV[0].class == 'string'.class

chars_saved = 0
romans.each do |roman|
  simple_roman, num = rom_to_i(roman)
  #p "#{roman}: #{simple_roman}, #{num}"
  chars_saved += (roman.size-simple_roman.size)
end

p chars_saved

# if you find 4 of the same numeral in a row (not M),
# => compress the numeral and check its left neighbor.
# => If left neighbor is the same as the updated right numeral,
# => remove the left neighbor and multiply the right numeral by 2
