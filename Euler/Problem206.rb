#1_2_3_4_5_6_7_8_9_0
#1929374254627488900
max = Math.sqrt(1929394959697989990).ceil
min = Math.sqrt(1020304050607080900).floor

max.downto(min).each do |num|
  sq_num = (num ** 2).to_s
  if sq_num[0] == '1'
    if sq_num[2] == '2'
      if sq_num[4] == '3'
        if sq_num[6] == '4'
          if sq_num[8] == '5'
            if sq_num[10] == '6'
              if sq_num[12] == '7'
                if sq_num[14] == '8'
                  if sq_num[16] == '9'
                    if sq_num[18] == '0'
                      p num
                      break
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
