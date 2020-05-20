# Let input be an array length n, where every element of a is drown from a set of
# distinct values D, that have some total ordering. With a comparison sort of D
# we can modify counting sort to operate when we don't know what D is before hand, and
# no restriction on it's range.
# Let k = |D| then, if the insert and conversion to an array time for the data structure holding
# D is O(1) and O(k), and the sort of the resultant array is klogk,
# then the running time of the new algorithm is O(n + k + klog_k)

def extended_counting_sort(input)
  sorted = Array.new(input.size)
  counts_map = {}
  # sum each number independently in the map
  input.each do |elem|
    previous = counts_map[elem] || 0
    counts_map[elem] = previous + 1
  end
  #sort the keys of the map to obtain the ordered list of D distinct elements
  d = counts_map.keys.sort #assumption: this runs in O(nlogn) time as it's a comparison sort
  # now build a map from elements to their position n the counts array
  counts_position_map = {}
  d.each_with_index {|elem, index| counts_position_map[elem] = index }
  # copy the counts into the counts map
  counts = d.map { |i| counts_map[i] }
  # sum the counts up in order such that each element contains the number of elements <= i
  (1..counts.size - 1).each { |i| counts[i] += counts[i - 1] }
  # and now everything works as before, including preservation
  # of the stability property, except we use the counts_position_map
  # to tell us where the element's index is in the counts array
  # now lay everything into the output
  (input.size - 1).downto(0).each do |index|
    input_elem = input[index]
    counts_position = counts_position_map[input_elem]
    counts_elem = counts[counts_position] # ow many elements are less than this?
    # our arrays are zero indexed
    output_index = counts_elem - 1
    sorted[output_index] = input_elem
    counts[counts_position] -= 1
  end
  sorted
end

input = [1, 2, 4, 5, 6, 99, 100, 312923213, 2**100].shuffle
puts input.inspect
sorted = extended_counting_sort(input)
puts sorted.inspect
