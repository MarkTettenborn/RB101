# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#  - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#  - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

# data stucture to represent deck, player's cards and dealer's cards

# assumptions
#   suit is irrelevant
#   face cards (except aces) are fungible

# nested hashes? - initialize deck
CARDS = {:deck => {:aces => 4, :face_cards => 12, :ten => 4, :nine => 4, :eight => 4, 
:seven => 4, :six => 4, :five => 4, :four => 4, :three => 4, :two => 4},
:player_cards => {:aces => 0, :face_cards => 0, :ten => 0, :nine => 0, :eight => 0, 
:seven => 0, :six => 0, :five => 0, :four => 0, :three => 0, :two => 0},
:dealer_cards => {:aces => 0, :face_cards => 0, :ten => 0,:nine => 0, :eight => 0, :seven => 0,
:six => 0, :five => 0, :four => 0, :three => 0, :two => 0}}


# for now simplify by making aces always woth 11
CARD_VALUES = {:aces => 11, :face_cards => 10, :ten => 10, :nine => 9, :eight => 8, 
:seven => 7, :six => 6, :five => 5, :four => 4, :three => 3, :two => 2}



def random_card(cards)
  n = (1..cards[:deck].values.sum).to_a.sample
end

# dealing
# move two cards at random from deck to player
# move two cards at random from deck to dealer


def identify_nth_card(cards, n)
  running_total = 0
  deal_card = ''
  cards[:deck].each do |k, v|
    running_total += v
    deal_card = k
    break if running_total >= n
  end
deal_card
end

def deal_player(cards, n)
  cards[:deck][n] -= 1
  cards[:player_cards][n] += 1
end

def deal_dealer(cards, n)
  cards[:deck][n] -= 1
  cards[:dealer_cards][n] += 1
end

def deal_card(cards, person)
    card_position = random_card(cards)
    card_type = identify_nth_card(cards, card_position)
    if person == 'player' 
      deal_player(cards, card_type)
    else person == 'dealer'
      deal_dealer(cards, card_type)
    end
end

def initial_deal(cards)
  2.times {deal_card(cards, 'player')}
  2.times {deal_card(cards, 'dealer')}
  cards
end


def player_choice(cards)
  loop do
    puts cards[:player_cards]
    puts 'hit or stay?'
    answer = gets.chomp
    if answer.downcase.start_with?('h')
      deal_card(cards, 'player')
    else 
      puts "you stuck on #{score(cards)[:player]}"
      break
    end
    if bust?(cards)
      puts 'you went bust!'
      break
    end
  end
end

# issue - dealer never hits
def dealer_choice(cards)
  loop do
  break if score(cards)[:dealer] >= 17 || score(cards)[:player] > 21
  deal_card(cards, 'dealer')
  end
end

def score(cards)
  current_score = {:player => 0, :dealer => 0}
    
  cards[:player_cards].each do |k, v|
    current_score[:player] += v * CARD_VALUES[k]
  end
  
  cards[:dealer_cards].each do |k, v|
    current_score[:dealer] += v * CARD_VALUES[k]
  end  
  current_score
end

def bust?(cards)  
  score(cards)[:player] > 21 || score(cards)[:dealer] > 21
end

def determine_winner(cards)
  if score(cards)[:player] > score(cards)[:dealer] && 
     score(cards)[:player] <= 21 ||
     score(cards)[:dealer] > 21
     winner = 'player'
  else
    winner = 'dealer'
  end
winner
end
    

# game loop

loop do
  cards = CARDS
  initial_deal(cards)
  player_choice(cards)
  if bust?(cards)
    puts score(cards)
    puts 'player lost'
  else
    dealer_choice(cards)
    puts score(cards)
  end
  puts "#{determine_winner(cards)} won"
  puts 'play again (y/n)?'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

# too many cards in hand on subsequent games