sumSquares = 0
sum = 0
(1..100).each { |num| sumSquares += num**2 }
(1..100).each { |num| sum += num }
squareSums = sum**2
sumSquareDiff = squareSums - sumSquares
p sumSquareDiff
