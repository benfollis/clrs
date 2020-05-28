#Give a memoized version of LCS-L ENGTH that runs in O.mn/ time.
def print_array(array)
  array.each_with_index {|row, index| puts "#{index}: #{row.inspect}"}
  puts "-----"
end



def lcs_length_helper(x, y, i, j, c)
  if !c[i][j].nil? then
      return c[i][j]
  end
  if i==0 || j == 0
    c[i][j] = 0
    return 0
  end
  if x[i-1] == y[j-1] then
    c[i][j] = lcs_length_helper(x, y, i-1, j-1, c) + 1
    return c[i][j]
  end
  c[i][j] = [lcs_length_helper(x, y, i, j-1, c), lcs_length_helper(x, y, i-1, j, c)].max
  return c[i][j]
end

def lcs_length(x, y)
  m = x.size
  n = y.size
  c = Array.new(m+1){Array.new(n+1, nil)}
#  m+1.times {|i| c[i][0] = 0 }
#  n+1.times {|j| c[0][j] = 0 }
  max_len = lcs_length_helper(x, y, x.size, y.size, c)
  print_array c
  max_len
end

puts lcs_length("ABCBDAB", "BDCABA")