ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# find lowest age

values = ages.values
puts values.inspect


counter = 0
lowest_value = values[0]

loop do
  break if counter == values.size
  current_value = values[counter]
  if current_value < lowest_value
    lowest_value = current_value
  end
  counter += 1
  lowest_value
  
end

puts lowest_value
puts counter

