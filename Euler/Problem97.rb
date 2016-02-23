require 'prime'

num = (28433 * (2 ** 7830457)) + 1
p num.to_s[-10..-1]
