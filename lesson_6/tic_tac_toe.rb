# working on keep_score method

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

score = {player: 0, computer: 0}

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(array, joining_word='or')
  array[0..-2].join(', ') + " #{joining_word} " + array[-1].to_s
end

def display_board(brd)
  
  prompt("you're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}")
  puts ""
  puts "     |     |"
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "choose a square: #{empty_squares(brd).join(',')}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "invalid choice, choose again"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !! detect_winner(brd)
end
  
def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def keep_score(brd, score)
  if detect_winner(brd) == 'Player'
    score[:player] += 1
  elsif detect_winner(brd) == 'Computer'
    score[:computer] += 1
  end
end
    
loop do
  board = initialize_board
  
  loop do
    display_board(board)
    
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end
  
  if someone_won?(board)
    prompt("#{detect_winner(board)} won!")
  else
    prompt "It's a tie"
  end
  
  keep_score(board, score)
  puts score
  break if score[:player] == 5 || score[:computer] == 5
  
  prompt('play again (y/n)?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
  
