require "pry"
require "pry-byebug"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
COUPLETS = {
  1 => [[2, 3], [4, 7], [5, 9]],
  2 => [[1, 3], [5, 8]],
  3 => [[1, 2], [5, 7], [6, 9]],
  4 => [[1, 7], [5, 6]],
  5 => [[1, 9], [2, 8], [3, 7], [4, 6]],
  6 => [[3, 9], [4, 5]],
  7 => [[1, 4], [8, 9], [5, 3]],
  8 => [[2, 5], [7, 9]],
  9 => [[1, 5], [3, 6], [7, 8]],
}

INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"

def prompt(input)
  puts "==> #{input}"
end

def joinor(arr, delimiter = ", ", word = "or")
  case arr.size
  when 0 then ""
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def joinor(arr, delimiter = ", ", word = "or")
  case arr.size
  when 0 then ""
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system "clear"
  puts " Player = #{PLAYER_MARKER} Computer = #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]} "
  puts "     |     |"
  puts ""
end

# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_boar[8]}  |  #{brd[9]} "
  puts "     |     |"
  puts ""
end

# rubocop:enable Metrics/AbcSizd
end

def display_score(player_score, comp_score)
  prompt "SCORE - Player: #{player_score} Computer: #{comp_score}"
end

def display_match_winner(player_score, comp_score)
  if player_score == 5
    prompt "Player wins the match!"
  else
    prompt "The Computer wins the match!"
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def place_piece!(board, participant)
  if participant == "Player"
    player_move!(board)
  else
    computer_move!(board)
  end
end

def alternate_player(participant)
  if participant == "Player"
    return "Computer"
  else
    return "Player"
  end
end

def player_move!(board)
  square = ""
  loop do
    prompt "Choose a square (#{joinor(empty_squares(board))})"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "invalid play"
  end
  board[square] = PLAYER_MARKER
end

def computer_move!(board)
  if threatened_square(board, COMPUTER_MARKER)
    square = threatened_square(board, COMPUTER_MARKER)
  elsif threatened_square(board, PLAYER_MARKER)
    square = threatened_square(board, PLAYER_MARKER)
  elsif board[5] == " "
    square = 5
  else
    square = empty_squares(board).sample
  end
  board[square] = COMPUTER_MARKER
end

def threatened_square(board, marker)
  empty_squares(board).each do |square|
    COUPLETS[square].each do |couplet|
      if board.values_at(*couplet).count(marker) == 2
        return square
      end
    end
  end
  nil
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif board.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

loop do
  comp_score = 0
  player_score = 0
  starting_player = ""
  loop do
    #TODO : break this into a standalone method
    #! make it case insensitive
    prompt "Who would you like to go first? (Player or Computer)"
    starting_player = gets.chomp
    break if (starting_player == "Player" || starting_player == "Computer")
    prompt "invalid input: please choose either Player or Computer"
  end
  loop do
    board = initialize_board
    current_player = starting_player

    loop do
      display_board(board)
      display_score(player_score, comp_score)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    if someone_won?(board)
      display_board(board)
      prompt "#{detect_winner(board)} won this round"
      if detect_winner(board) == "Player"
        player_score += 1
      elsif detect_winner(board) == "Computer"
        comp_score += 1
      end
    else
      display_board(board)
      prompt "Round ends in a tie"
    end
    prompt "Hit enter to play next round"
    gets

    break if comp_score == 5 || player_score == 5
  end
  display_match_winner(player_score, comp_score)
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt "Thanks for playing Tic Tac Toe! Good bye"
