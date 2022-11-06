def score(cards)
  initial_score = {:player => 0, :dealer => 0}
  revised_score = {:player => 0, :dealer => 0}
  
  cards[:player_cards].each do |k, v|
    initial_score[:player] += v * CARD_VALUES[k]
  end
  
  cards[:dealer_cards].each do |k, v|
    initial_score[:dealer] += v * CARD_VALUES[k]
  end
  
  

def basic_score(cards)
  current_score = {:player => 0, :dealer => 0}
    
  cards[:player_cards].each do |k, v|
    current_score[:player] += v * CARD_VALUES[k]
  end
  
  cards[:dealer_cards].each do |k, v|
    current_score[:dealer] += v * CARD_VALUES[k]
  end  
  current_score
end

def score(cards)
  initial_score = basic_score(cards)
  
  if initial_score[:player] > 21 && cards[:player][:aces] > 0 
    revised_score[:player] = initial_score[:player] - 10
  else
    revised_score[:player] = initial_score[:player]
  end
  
  if initial_score[:dealer] > 21 && cards[:dealer][:aces] > 0 
    revised_score[:dealer] = initial_score[:dealer] - 10
  else
    revised_score[:dealer] = initial_score[:dealer]
  end
  
  revised_score
end


