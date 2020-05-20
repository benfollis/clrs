# sorts the input array input of length n which has
# k distinct elements in the range 0...k in O(n) time
def counting_sort(input, k)
  counts = Array.new(k+1)
  sorted = Array.new(input.size)
  (0..k).each { |i| counts[i] = 0 }
  # set counts [i] to the number of elements equal to i
  input.each { |element| counts[element] += 1 }
  # to preserve STABILITY we actually have to
  # track the less than or equal counts and
  # use the input array, however if we were just sorting
  # integers, (or things we don't care about for stability)
  # we could just iterate the counts from large to small
  # and output that many elements of i to the end of the output array

  # set counts[i] to the number of elements in input <= i
  (1..k).each { |i| counts[i] += counts[i-1] }
  # now lay everything into the output
  (input.size-1).downto(0).each do |index|
    input_elem = input[index]
    counts_elem = counts[input_elem] # ow many elements are less than this?
    # our arrays are zero indexed
    output_index = counts_elem - 1
    sorted[output_index] = input_elem
    counts[input_elem] -= 1
  end
  sorted
end

unsorted = [0, 5, 7, 9, 10, 11, 15].shuffle
puts unsorted.inspect
sorted = counting_sort(unsorted, 15)
puts sorted.inspect
