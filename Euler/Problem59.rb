file = File.open("input_files/p059_cipher.txt", "r")
arr = file.read.split(',')

arr[-1] = arr[-1][0..-2]

# check if the character is likely to be part of the decrypted text
def regular_char?(int)
  int = int.ord
  if ((int > 96) & (int < 123)) | # lower case letters
     ((int > 64) & (int < 91)) | # capital letters
     ((int > 47) & (int < 58)) | # numbers
     (int == 32) | (int == 40) | # space and (
     (int == 41) | (int == 46) | # ) and .
     (int == 39) | (int == 33) | # ' and !
     (int == 44) | (int == 63) | # , and ?
     (int == 59) | (int == 58)   # ; and :
    return true
  end
  return false
end

# decrypt the character
def decrypt(char, key)
  return (char.ord ^ key.ord).chr
end

c1s = ('a'..'z').to_a
c2s = ('a'..'z').to_a
c3s = ('a'..'z').to_a
a_to_z = ('a'..'z').to_a

(0...arr.size).step(3) do |index|
  a_to_z.each do |c1|
    c1s.delete(c1) if regular_char?(decrypt(arr[index].to_i, c1)) == false
  end
  a_to_z.each do |c2|
    if arr[index+1] != nil
      c2s.delete(c2) if regular_char?(decrypt(arr[index+1].to_i, c2)) == false
    end
  end
  a_to_z.each do |c3|
    if arr[index+2] != nil
      c3s.delete(c3) if regular_char?(decrypt(arr[index+2].to_i, c3)) == false
    end
  end
end

msg = ""
if (c1s.size == 1) & (c2s.size == 1) & (c3s.size == 1)
  (0...arr.size).step(3) do |index|
    msg << decrypt(arr[index].to_i, c1s[0])
    msg << decrypt(arr[index+1].to_i, c2s[0]) if arr[index+1] != nil
    msg << decrypt(arr[index+2].to_i, c3s[0]) if arr[index+2] != nil
  end
end
#p msg

sum = 0
msg.each_char { |char| sum += char.ord }
p sum
