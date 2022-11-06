# Currently, we're using the Array#join method, which can only insert 
# a delimiter between the array elements, and isn't smart enough to 
# display a joining word for the last element.

# Write a method called joinor that will produce the following result:

def joinor(array, joining_word='or')
  array[0..-2].join(', ') + " #{joining_word} " + array[-1].to_s
end

puts joinor([1, 2], 'or')     
puts joinor([1, 2, 3], 'and')  

# Computer AI: Defense

# The computer currently picks a square at random. That's not very 
# interesting. Let's make the computer defensive minded, so that if there's 
# an immediate threat, then it will defend the 3rd square. We'll consider an 
# "immediate threat" to be 2 squares marked by the opponent in a row. If 
# there's no immediate threat, then it will just pick a random square.

# iterate through winning lines
# if two computer markers and a space, place computer marker in space
# if two player markers and a space, place computer marker in space
# if neither condition met for any line, then:
#   if square 5 empty, place computer marker
#   else place computer marker at random



def computer_places_piece!(brd)
  square = if next_move_win?(brd, COMPUTER_MARKER)
              find_winning_move(brd, COMPUTER_MARKER)
           elsif next_move_win?(brd, PLAYER_MARKER)
              find_winning_move(brd, PLAYER_MARKER)
           elsif brd[5] == INITIAL_MARKER
              5
           else
              empty_squares(brd).sample
           end
    brd[square] = COMPUTER_MARKER
end

def find_winning_move(brd, marker)  
  if WINNING_LINES.each do |line|
    brd.values_at(*line).count(marker) == 2 &&
    brd.values_at(*line).count(INITIAL_MARKER) == 1
       return brd.select do |k, v|
       line.include?(k) && v == INITIAL_MARKER
     end.key(INITIAL_MARKER)
    end
  end
  nil
end

def next_move_win?(brd, player)
  !!find_winning_move(brd, player)
end


def determine_starter_computer
  starter = ['player', 'computer'].sample
  prompt("the #{starter} will move first")
  starter
end

# place_piece! is a generic method that will know how to place the piece on 
# the board depending on the current_player. That is, it will call 
# player_places_piece! or computer_places_piece! depending on the value 
# of current_player

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
end

def alternate_player(current_player)
  if current_player == 'player'
    current_player = 'computer'
  else
    current_player = 'player'
  end
end
  
  
end