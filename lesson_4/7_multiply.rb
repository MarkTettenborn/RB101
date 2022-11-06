def multiply!(numbers, multiplier)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] = numbers[counter] * multiplier

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts multiply!(my_numbers, 5) # => [2, 8, 6, 14, 4, 12]