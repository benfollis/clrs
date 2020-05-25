#Show how to compute the length of an LCS using only 2min.m; n/ entries in the c
# table plus O.1/ additional space. Then show how to do the same thing, but using
# min.m; n/ entries plus O.1/ additional space.
#
#
def print_array(array)
  array.each_with_index {|row, index| puts "#{index}: #{row.inspect}"}
  puts "-----"
end

#part 1
def lcs_length_aux(x, y)
  m = x.size
  n = y.size
  c = Array.new(2){Array.new(n+1, 0)}
  (1..m).each do |i|
    (1..n).each do |j|
      #   puts "i: #{i}, j: #{j}, X_i:#{x[i-1]}, Y_j:#{y[j-1]}"
      # x and y are zero indexed
      if (x[i-1] == y[j-1]) then
        c[1][j] = c[0][j-1] + 1
      elsif c[0][j] >= c[1][j-1]
        c[1][j] = c[0][j]
      else
        c[1][j] = c[1][j-1]
      end
        #  print_array(c)
    end
    #print_array(c)
    c[0] = c[1]
    c[1] = Array.new(n+1, 0)
  end
  return c[0][n] #we use 0,n because we reset it on the lines above to prepare for next iteration
end

def lcs_length(x, y)
  # we get 2min(x, y) because lcs_length uses size 2*|y|
  if (x.size > y.size) then
    return lcs_length_aux(x, y)
  end
  return lcs_length_aux(y, x)
end

result = lcs_length("ABCBDAB", "BDCABA")
puts result

#part 2
