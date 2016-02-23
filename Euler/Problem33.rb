prods = []
(10..99).each do |num|
  (10..99).each do |den|
    if num < den
      unless (num%10 == 0) & (den%10 == 0)
        real_frac = (num/(den+0.0))
        s_num = num.to_s
        s_den = den.to_s
        if (s_num[0] == s_den[0])
          fake_frac = s_num[1].to_i/(s_den[1].to_i+0.0)
          prods << real_frac if real_frac == fake_frac
        elsif (s_num[0] == s_den[1])
          fake_frac = s_num[1].to_i/(s_den[0].to_i+0.0)
          prods << real_frac if real_frac == fake_frac
        elsif (s_num[1] == s_den[0])
          fake_frac = s_num[0].to_i/(s_den[1].to_i+0.0)
          prods << real_frac if real_frac == fake_frac
        elsif (s_num[1] == s_den[1])
          fake_frac = s_num[0].to_i/(s_den[0].to_i+0.0)
          prods << real_frac if real_frac == fake_frac
        end
      end
    end
  end
end
#p prods
p prods.inject(:*).to_s[0..5].to_r
