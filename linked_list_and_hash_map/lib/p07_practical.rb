require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  my_hash = Hash.new

  string.chars.each do |let|
    if my_hash.include?(let)
       value = my_hash[let]
       value += 1
       my_hash[let] = value
    else
      my_hash[let] = 1
    end

  end


  palindrome = 0
  my_hash.each do |k ,v|
    if v.odd?
      palindrome += 1
    end
  end

  palindrome < 2

end

# my_hash = HashMap.new(8)
#
# string.chars.each do |let|
#   if my_hash.include?(let)
#      value = my_hash.get(let)
#      value += 1
#      my_hash.set(let, value)
#   else
#     my_hash.set(let, 1)
#   end
#   p my_hash.get(let)
# end
#
#
# palindrome = 0
# my_hash.each do |node|
#   if node[1].odd?
#     palindrome += 1
#   end
# end
#
# palindrome < 2
