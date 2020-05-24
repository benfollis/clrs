def button_up_cut_rod_with_cut_cost(length_prices, length_of_rod, cost_of_cut)
  r = Array.new(length_of_rod)
  r[0] = 0
  (1..length_of_rod).each do |j|
    q = -1
    cut_position = -1
    (1..j).each do |i|
      value_of_sub_rods = length_prices[i] + r[j - i]
      if (q < value_of_sub_rods) then
        q = value_of_sub_rods
        cut_position = i
      end
    end
    r[j] = q
    if (cut_position != j) then # that is, did we cut the rod
      r[j] -= cost_of_cut # by subtracting it from here, we're factoring in the cut cost for every other problem that uses this cut
    end
  end
  return r[length_of_rod]
end

length_prices = [0, 1, 5, 8, 9, 10, 17, 17, 20, 24, 30]

(1..10).each { |rodlen| puts "#{rodlen} for #{button_up_cut_rod_with_cut_cost(length_prices, rodlen, 1)}" }

