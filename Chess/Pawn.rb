require_relative "Piece"

class Pawn < Piece

  attr_accessor :first_move

  REGULAR_DIRS_BLACK = [[1, 0]]
  REGULAR_DIRS_WHITE = [[-1, 0]]
  TAKE_DIRS_BLACK = [[1, 1], [1 -1]]
  TAKE_DIRS_WHITE = [[-1, -1], [-1, 1]]
  INITIAL_DIRS_BLACK = [[1, 0], [2, 0]]
  INITIAL_DIRS_WHITE = [[-1, 0], [-2, 0]]

  def initialize(color, board, pos)
    @first_move = true
    super(color, board, pos)
  end

  def valid_moves
    valids = []

    move_dirs.each do |direction|
      new_pos = Piece.add_pos(@pos, direction)
      valids << new_pos if Board.within_board?(new_pos) && @board[new_pos[0]][new_pos[1]].nil?
    end
    valids + opposite_squares
  end

  def initial_directions
    valids = []
    
    if @color == :black

      new_pos = Piece.add_pos(@pos, INITIAL_DIRS_BLACK[0])

      if Board.within_board?(new_pos) && @board[new_pos[0]][new_pos[1]].nil?
        valids << new_pos 
        new_pos = Piece.add_pos(@pos, INITIAL_DIRS_BLACK[1])
        if Board.within_board?(new_pos) && @board[new_pos[0]][new_pos[1]].nil?
          valids << new_pos 
        end
      end

    else
      new_pos = Piece.add_pos(@pos, INITIAL_DIRS_WHITE[0])
      
      if Board.within_board?(new_pos) && @board[new_pos[0]][new_pos[1]].nil?
        valids << new_pos 
        new_pos = Piece.add_pos(@pos, INITIAL_DIRS_WHITE[1])
        if Board.within_board?(new_pos) && @board[new_pos[0]][new_pos[1]].nil?
          valids << new_pos 
        end
      end
    end

    valids
  end
  
  def move_dirs
    if color == :black
      if first_move
        @first_move = false
        initial_directions 
      else
        REGULAR_DIRS_BLACK 
      end

    else
      if first_move
        @first_move = false
        initial_directions 
      else
        REGULAR_DIRS_WHITE 
      end
    end
  end

  def opposite_squares #(pos, @board)
    possible_squares = []

    if @color == :black
      diagonals = [[1, 1], [1, -1]]

      diagonals.each do |diagonal|
        potential_pos = Piece.add_pos(diagonal, @pos)
        possible_squares << potential_pos if @board[potential_pos[0]][potential_pos[1]].color == :white
      end

    else
      diagonals = [[-1, -1], [-1, 1]]

      diagonals.each do |diagonal|
        potential_pos = Piece.add_pos(diagonal, @pos)
        possible_squares << potential_pos if @board[potential_pos[0]][potential_pos[1]].color == :black
      end
    end
    possible_squares
  end

end