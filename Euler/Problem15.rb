grid_size = 20
grid = {}
grid_size.downto(0).each do |x|
  grid_size.downto(0).each do |y|
    index = (x.to_s+","+y.to_s).to_sym
    if (x == grid_size) & (y == grid_size)
      grid[index] = 1
    else
      if x < grid_size
        rightIndex = ((x+1).to_s + "," + y.to_s).to_sym
        rightNode = grid[rightIndex]
      else
        rightNode = 0
      end

      if y < grid_size
        downIndex = (x.to_s + "," + (y+1).to_s).to_sym
        downNode = grid[downIndex]
      else
        downNode = 0
      end

      grid[index] = rightNode + downNode
    end
  end
end

p grid[:"0,0"]
#p grid[:"0,0"] == 137846528820
