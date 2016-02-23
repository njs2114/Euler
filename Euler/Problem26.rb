require "bigdecimal"
precision = 10000

max_rep_size = 0
max_denom = 0

(7..999).each do |denom|
  decimal = BigDecimal.new('1.0').div(denom, precision).to_s
  decimal = decimal[2..-5]

  if decimal[-6..-1] != decimal[-12..-7]
    #p decimal

    repeat = []
    current = []
    cur_index = 0
    rep_index = 0
    decimal.each_char do |char|
      if rep_index < 4
        repeat << char
        rep_index += 1
      else
        if char == repeat[0]
          if repeat.join == decimal[cur_index..(cur_index+3)]
            repeat = decimal[0..cur_index-1].split('')
            #p repeat.join
            if max_rep_size < repeat.size
              max_rep_size = repeat.size
              max_denom = denom
            end
          end
        end
      end
      current << char
      cur_index += 1
    end
  end
end

p max_rep_size
p max_denom
