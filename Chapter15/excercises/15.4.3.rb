#Give a memoized version of LCS-L ENGTH that runs in O.mn/ time.

def lcs_length_helper(x, y, c)

end

def lcs_length(x, y)
  m = x.size
  n = y.size
  c = Array.new(m+1){Array.new(n+1, 0)}
  puts c.inspect
end

lcs_length("ABC", "C")