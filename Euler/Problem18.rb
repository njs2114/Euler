bigTri =                                 [["75"],
                                       ["95", "64"],
                                    ["17", "47", "82"],
                                 ["18", "35", "87", "10"],
                              ["20", "04", "82", "47", "65"],
                           ["19", "01", "23", "75", "03", "34"],
                        ["88", "02", "77", "73", "07", "63", "67"],
                     ["99", "65", "04", "28", "06", "16", "70", "92"],
                  ["41", "41", "26", "56", "83", "40", "80", "70", "33"],
               ["41", "48", "72", "33", "47", "32", "37", "16", "94", "29"],
            ["53", "71", "44", "65", "25", "43", "91", "52", "97", "51", "14"],
         ["70", "11", "33", "28", "77", "73", "17", "78", "39", "68", "17", "57"],
      ["91", "71", "52", "38", "17", "14", "91", "43", "58", "50", "27", "29", "48"],
   ["63", "66", "04", "68", "89", "53", "67", "30", "73", "16", "69", "87", "40", "31"],
["04", "62", "98", "27", "23", "09", "70", "98", "73", "93", "38", "53", "60", "04", "23"]]

litTri =     [["3"],
           ["7", "4"],
        ["2", "4", "6"],
      ["8", "5", "9", "3"]]

def options(row, num, tri)
  return [tri[row+1][num], tri[row+1][num+1]]
end

def triCut(num, tri)
  tempTri = []

  if num == 0
    # shave off right side
    tri.each do |row|
      if row.size > 1
        tempTri << row[0...(row.size)-1]
      end
    end
  else
    #shave off left side
    tri.each do |row|
      if row.size > 1
        tempTri << row[1..(row.size)-1]
      end
    end
  end

  return tempTri
end

def weight(tri)
  total = 0
  tri.each do |row|
    row.each do |num|
      total += num.to_i
    end
  end
  return total
end

def triShorten(tri)
  newRow = []
  lastRow = tri.size-1
  curRow = lastRow-1
  (0..curRow).each do |num|
    newRow << (options(curRow,num,tri).max.to_i + tri[curRow][num].to_i).to_s
  end
  tri.delete_at(lastRow)
  tri.delete_at(curRow)
  tri << newRow
  return tri
end

def wApp(tri) #weighted approach
  cutTri = tri
  total = tri[0][0].to_i
  cutTri.each do |row|
    rTri = triCut(1, cutTri)
    lTri = triCut(0, cutTri)
    rWeight = weight(rTri)
    lWeight = weight(lTri)
    if rWeight > lWeight
      cutTri = rTri
    else
      cutTri = lTri
    end
    total += cutTri[0][0].to_i unless cutTri[0] == nil
  end
  return total
end

def uApp(tri) #bottom up
  (0...tri.size-1).each { tri = triShorten(tri) }
  return tri[0][0]
end

#p wApp(litTri)
#p wApp(bigTri)

#uApp(litTri)
p uApp(bigTri)
