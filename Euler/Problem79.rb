file = File.open("input_files/p079_keylog.txt", "r")
arr = file.readlines[0..file.size]

entries = []
arr.each do |entry|
  entries << entry[0..-2]
end
entries.uniq!
p entries

#73162890
