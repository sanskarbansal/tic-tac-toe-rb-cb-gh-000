WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]
]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(index)
  index.to_i - 1
end
def move(board, pos, val)
  board[pos] = val
end

def position_taken?(board, pos)
   board[pos]=="X" || board[pos]=="O"
end

def valid_move?(board, pos)
  (pos >= 0 && pos <=8) && !position_taken?(board, pos)
end

def turn(board)
  puts "Please enter a number between 1-9:"
  number = input_to_index(gets.strip)
  if valid_move?(board, number)
    move(board, number, "X")
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |i|
    if i == "X" || i == "O"
      count += 1
    end
  end
  return count
end
def current_player(board)
  n = turn_count(board)
  if n%2 == 0
    return "X"
  end
  return "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |win_comb|
    if win_comb.all?{ |i| i=='X'}
      return true
    end
    if win_comb.all?{ |i| i=='O'}
      return true
    end
  end
  return false
end
