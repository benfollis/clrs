#Give an O.n2 /-time algorithm to find the longest monotonically increasing subse-
# quence of a sequence of n numbers.
#
# This is fairly simple if we take the intial sequence, and sort it in increasing order
# that will take O(nlogn) time with a comparison sort. We then run that through a
# LCS algorithm which takes O(n*m) = O(n*n) = O(n^2) since |seq| == |sorted seq|

require "../../Chapter15/lcs"

sequence = [1, 4, 3, 9, 2, 10]
sorted = sequence.sort
puts sequence.inspect
puts sorted.inspect

b, c = lcs_length(sequence, sorted)
print_lcs(b, sequence, sequence.size-1, sorted.size-1)
puts ""
