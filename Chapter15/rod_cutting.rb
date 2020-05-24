
def button_up_cut_rod(length_prices, length_of_rod)
  r = Array.new(length_of_rod)
  r[0] = 0
  (1..length_of_rod).each do |j|
    q = -1
    (1..j).each do |i|
      q = [q, length_prices[i]+ r[j-i]].max
    end
    r[j] = q
  end
  return r[length_of_rod]
end

length_prices = [0, 1, 5, 8, 9, 10, 17, 17, 20, 24, 30]

(1..10).each { |rodlen| puts "#{rodlen} for #{button_up_cut_rod(length_prices, rodlen)}"}
