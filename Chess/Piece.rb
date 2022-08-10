require "byebug"
require_relative "Board"

class Piece
  attr_reader :board, :color
  attr_accessor :pos

  def initialize (color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def self.add_pos(p1, p2)
    p1.map.with_index { |num, i| num + p2[i] }
  end
end

module Slidable

  HORIZONTAL_DIRS = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, 1], [1, -1]]

  def valid_moves
    valid_moves = []

    move_dirs.each do |direction|
      cur_pos = @pos
      while Board.within_board?(cur_pos)
        cur_pos = Piece.add_pos(cur_pos, direction)
        break if !Board.within_board?(cur_pos) || Board.get_color(@board, cur_pos) == color
        valid_moves << cur_pos #if Board.within_board?(cur_pos) && Board.get_color(@board, cur_pos) != color
      end
    end

    valid_moves
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

end


class Rook < Piece
  include Slidable

  def move_dirs
    horizontal_dirs
  end

end

class Bishop < Piece
  include Slidable

  def move_dirs
    diagonal_dirs
  end
end

class Queen < Piece
  include Slidable

  def move_dirs
    diagonal_dirs + horizontal_dirs
  end
end

class Knight < Piece

  include Stepable

  def move_dirs
    knight_dirs
  end

end

module Stepable
  
  KNIGHT_DIRS = [ [-1, -2], [-2, -1], [-2,  1], [-1,  2], [ 1, -2], [ 2, -1], [ 2,  1], [ 1,  2] ]

  def knight_dirs
    KNIGHT_DIRS
  end

  def valid_moves
    valids = []

    move_dirs.each do |direction|
      new_pos = Piece.add_pos(@pos, direction)
      valids << new_pos if Board.within_board?(new_pos) && Board.get_color(@board, new_pos) != color
    end 

    valids
  end
end 

class Pawn < Piece
  INITIAL_DIRS_BLACK = [[1, 0], [2, 0]]
  INITIAL_DIRS_WHITE = [[-1, 0], [-2, 0]]
  REGULAR_DIRS_BLACK = [[1, 0]]
  REGULAR_DIRS_WHITE = [[-1, 0]]
  TAKE_DIRS_BLACK = [[1, 1], [1 -1]]
  TAKE_DIRS_WHITE = [[-1, -1], [-1, 1]]

  include Stepable

  def move_dirs
    if color == :black

      if first_move
        INITIAL_DIRS_BLACK
      elsif opposite_squares(:white, @pos)
        REGULAR_DIRS_BLACK + TAKE_DIRS_BLACK
      else
        REGULAR_DIRS_BLACK
      end

    else 

      if first_move
        INITIAL_DIRS_WHITE
      elsif opposite_squares(:white, @pos)
        REGULAR_DIRS_WHITE + TAKE_DIRS_WHITE
      else
        REGULAR_DIRS_WHITE
      end

    end
  end

  def opposite_squares(color, pos, @board)
    possible_squares = []

    if color == :white
      diagonals = [[1,1], [1,-1]]

      diagonals.each do |diagonal| 
        potential_pos = Piece.add(diagonal, pos)
        possible_squares << potential_pos if @board(potential_pos).color == :white
      end
  end
end


