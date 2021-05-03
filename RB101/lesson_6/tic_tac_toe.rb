# input: player input of position of next play
# output: a board with the players position choice and the computers, outcome of the game if it has met certain criteria
# rules:
#   1.display empty board
#   2. player inputs move
#   3. computer generates a move
#   4. updated board is displayed
#   5. if winner display winner
#   6. if board full, display tie
#   7. if neither, back to 2
#   8. if game over, ask player to play again, if yes back to 1
#   9. display exit message
require "pry"
require "pry-byebug"
INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"

def prompt(input)
  puts "==> #{input}"
end

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

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_move!(board)
  square = ""
  loop do
    prompt "Choose a square (#{empty_squares(board).join(", ")})"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "invalid play"
  end
  board[square] = PLAYER_MARKER
end

def computer_move!(board)
  square = empty_squares(board).sample
  board[square] = COMPUTER_MARKER
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  winning_lines.each do |line|
    if board[line[0]] == PLAYER_MARKER &&
       board[line[1]] == PLAYER_MARKER &&
       board[line[2]] == PLAYER_MARKER
      return "Player"
    elsif board[line[0]] == COMPUTER_MARKER &&
          board[line[1]] == COMPUTER_MARKER &&
          board[line[2]] == COMPUTER_MARKER
      return "Computer"
    end
  end
  nil
end

loop do
  board = initialize_board

  loop do
    display_board(board)
    player_move!(board)
    break if someone_won?(board) || board_full?(board)
    computer_move!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt "Thanks for playing Tic Tac Toe! Good bye"
