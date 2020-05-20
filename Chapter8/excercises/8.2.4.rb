#Problem
#Describe an algorithm that, given n integers in the range 0 to k, preprocesses its
#input and then answers any query about how many of the n integers fall into a
#range [a, b] in O(1)/ time. Your algorithm should use O(n+k) preprocessing
#time.

# General overview
# This is just counting sort, where instead of using the counts array
# to sort the output you use it to query.
# Given the interval [a,b] the number of integers in the range is
# C[b] - C[a-1] (a-1 since you don't want to remove the number in a)

# Description via code

class CountingQuery

  def initialize(input, k)
    @counts = Array.new(k+1)
    (0..k).each { |i| @counts[i] = 0 }
    input.each { |element| @counts[element] += 1 }
    (1..k).each { |i| @counts[i] += @counts[i-1]}
  end

  def query(a, b)
    # the range is inclusive, so you don't want to
    # exclude the elements in a from your result
    return @counts[b] - @counts[a-1]
  end
end

k=100
input = (0..k).to_a
input << 12
oracle = CountingQuery.new(input, k)
puts oracle.query(10, 20)