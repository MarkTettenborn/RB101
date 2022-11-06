produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

def select_fruit(produce)
  
  counter = 0
  fruits = {}
  keys = produce.keys
  
  loop do
    break if (counter + 1) == (produce.length)
    
    current_key = keys[counter]
    current_value = produce[current_key]
    
      if current_value == 'Fruit'
        fruits[current_key] = current_value
      else
      end
    
    counter += 1
    
  end
  puts fruits
end

select_fruit(produce)