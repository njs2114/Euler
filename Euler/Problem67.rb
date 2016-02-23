#read in the triangle as an array of arrays of strings representing integers
file = File.open("input_files/p067_triangle.txt", "r")
arr = file.readlines[0..file.size]

triangle = []

arr.each do |row|
  triangle << row.split(" ")
end

def options(row, num, tri)
  return [tri[row+1][num].to_i, tri[row+1][num+1].to_i]
end

def triShorten(tri)
  newRow = []
  lastRow = tri.size-1
  curRow = lastRow-1
  (0..curRow).each do |num|
    newRow << (options(curRow,num,tri).max + tri[curRow][num].to_i).to_s
  end
  tri.delete_at(lastRow)
  tri.delete_at(curRow)
  tri << newRow
  return tri
end

def uApp(tri) #bottom up
  (0...tri.size-1).each { tri = triShorten(tri) }
  return tri[0][0]
end

p uApp(triangle)
