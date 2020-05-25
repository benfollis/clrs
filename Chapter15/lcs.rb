# Notes, My god 0 to 1 index conversions suck to get right
def print_array(array)
  array.each_with_index {|row, index| puts "#{index}: #{row.inspect}"}
  puts "-----"
end

# literal translation of algorithm accounting for
# 0 indexed strings
def lcs_length(s1, s2)
  m = s1.size
  n = s2.size
  b = Array.new(m){Array.new(n)}
  # init everyting to zero
  c = Array.new(m+1) { Array.new(n+1, 0)}
  (1..m).each do |i|
    (1..n).each do |j|
      #puts("i: #{i}, j: #{j} s1_i:#{s1[i]} s2_j:#{s2[j]}")
      #print_array(c)
      # 0 indexed on the string, so have to subtract 1 when looking at it
      if (s1[i-1] == s2[j-1]) then
        c[i][j] = c[i-1][j-1] + 1
        b[i-1][j-1] = "d" # up and to the right
      elsif c[i-1][j] >= c[i][j-1]
        c[i][j] = c[i-1][j]
        b[i-1][j-1] = "u" # up
      else
        c[i][j] = c[i][j-1]
        b[i-1][j-1] = "l" #left
      end
    end
  end
  #print_array(c)
  #print_array(b)
  return b,c
end


def print_lcs(b, x, i, j)
  return if i==-1 || j==-1
  if b[i][j] == "d"
    print_lcs(b, x, i-1, j-1)
    print x[i], ","
  elsif b[i][j] == "u"
    print_lcs(b, x, i-1, j)
  else
    print_lcs(b, x, i, j-1)
  end
end
s1_test = "ABCBDAB"
s2_test = "BDCABA"


b, c = lcs_length(s1_test, s2_test)
print_array(c)
print_lcs(b, s1_test, s1_test.size-1, s2_test.size-1)
puts ""
#Excercise 15.4.1
s1 = "10010101"
s2 = "010110110"
b, c = lcs_length(s1, s2)
print_lcs(b, s1, s1.size-1, s2.size-1)
puts ""


