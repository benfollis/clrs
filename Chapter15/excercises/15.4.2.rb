#Give pseudocode to reconstruct an LCS from the completed c table and the original
# sequences X D hx1 ; x2 ; : : : ; xm i and Y D hy1 ; y2; : : : ; y n i in O.m C n/ time,
# without using the b table.
#

require "../../Chapter15/lcs"


x = "ABCBDAB"
y = "BDCABA"

# note the c table is defined on length of the string (1 indexed)
# so we have to do the conversion back to 0 indexed when printing
def print_lcs(c, x, i, j)
  return if i==0 || j==0
  current = c[i][j]
#  puts "i: #{i}, j: #{j} current: #{c[i][j]}"
#  puts "Current #{current}"
  #this is mostly the reverse of what order we used them in
  if current == c[i-1][j]
    print_lcs(c, x, i-1, j)
  elsif current == c[i][j-1]
    print_lcs(c, x, i, j-1)
  else
    # only case left is current = c[i-1, j-1]
    print_lcs(c, x, i-1, j-1)
    print x[i-1] # zero index conversion
  end

end

b,c = lcs_length(x, y)

#print_array(c)
print_lcs(c, x, x.size, y.size)