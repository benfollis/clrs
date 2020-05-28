# Show, by means of a counterexample, that the following “greedy” strategy does
# not always determine an optimal way to cut rods. Define the density of a rod of
# length i to be pi =i, that is, its value per inch. The greedy strategy for a rod of
# length n cuts off a first piece of length i, where 1  i  n, having maximum
# density. It then continues by applying the greedy strategy to the remaining piece of
# length n  i.

@rod_length_prices = [0, 0.5, 4, 9, 10]
@densities = [0, 0.5, 2, 3, 2.5]
def greedy_algorithm(rod_length)
  return 0 if rod_length == 0
  densities_available = @densities[0,rod_length+1]
  max = densities_available.max
  consumed_length = densities_available.index(max)
  return (consumed_length * max) + greedy_algorithm(rod_length-consumed_length)
end

puts "Rod Prices: #{@rod_length_prices.inspect}, densities #{@densities.inspect}"
puts "Max profit of rod of length 4 by observaton is length 10"
puts "Gready calculates max profit of #{greedy_algorithm(4)}"