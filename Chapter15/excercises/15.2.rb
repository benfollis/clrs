#A palindrome is a nonempty string over some alphabet that reads the same for-
# ward and backward. Examples of palindromes are all strings of length 1, civic,
# racecar, and aibohphobia (fear of palindromes).
# Give an efficient algorithm to find the longest palindrome that is a subsequence
# of a given input string. For example, given the input character, your algorithm
# should return carac. What is the running time of your algorithm?
#
# The blow is false, do to counterexample
# Let X = <x1, x2, x3, ... xn> be string over the english alphabet and
# Let Z = <z1, z2, ... zn> be a longest palindromic subequence
# Optimal substructure:
# If xn = zn then we have Z'=z2,z3..zn-1 is a longest palindrome of
# X'=<x1,x2,x3...xn-1>
# If xn != zn then we have Z'=z2,z3,zn-1 is a longest palindrome of X'=<x1, x2 x3....xn-1>'
#counterexample X=aaabaaaa Z' is NOT a longest palindromic subsequence of X'
#
# wait, isn't the longest palindromic subsequence the longest common subsequence of X and X reversed?
# The basic idea is that any LCS of x and X reverse will have a character only if it appears in the same
# sequence in both strings. That will result in strings that only have "doubles" in X mirrored about some index i in X.
# Those by definition are palindrome substrings.
# Also, the LCS has to be a maximal palindrom, otherwise the maximal palindrome
# would be a longer LCS than the LCS we found.


require '../lcs'

x = "character"
x_reverse = x.reverse

b, c = lcs_length(x, x_reverse)
print_lcs(b, x, x.size-1, x.size-1)

# The runnign time of the algorithm is O(n) to reverse X and O(x^2) for the lcs comparison so the total time is O(n^2)