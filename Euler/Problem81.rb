def options(row, col, sq, size)
  max_dim = size
  return [] if ((row+1 >= max_dim) && (col+1 >= max_dim))
  return [sq[row][col+1].to_i] if row+1 >= max_dim
  return [sq[row+1][col].to_i] if col+1 >= max_dim
  return [sq[row+1][col].to_i, sq[row][col+1].to_i]
end

def cut_corner(sq)
  new_sq = sq.dup
  max_row = sq.size-1
  short_col = sq[max_row].size-1

  curr_row = max_row
  curr_col = short_col-1

  row = curr_row
  (curr_col..max_row).each do |col|
    if sq[row][col] != nil
      #p "#{sq[row][col]} #{options(row,col,sq,new_sq.size)}"
      new_sq[row][col] = (new_sq[row][col].to_i + options(row,col,sq,new_sq.size).min).to_s
      if new_sq[row+1] != nil && new_sq[row+1][col] != nil
        new_sq[row+1].pop
      end
      #p "#{new_sq[row][col]}, #{options(row,col,new_sq,new_sq.size)}"
    else
      new_sq.pop
    end
    row -= 1
  end
  return new_sq
end

file = File.open("input_files/p081_matrix.txt", "r")
arr = file.readlines[0..file.size]

square = []
arr.each do |entry|
  entry = entry[0...-1]
  square << entry.split(',')
end

158.times do
  square = cut_corner(square)
  #puts
end
p square[0][0].to_i
