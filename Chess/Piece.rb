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

  def inspect
    "#{@color}, #{@pos}, #{@symbol}"
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
        valid_moves << cur_pos
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

module Stepable

  KNIGHT_DIRS = [ [-1, -2], [-2, -1], [-2,  1], [-1,  2], [ 1, -2], [ 2, -1], [ 2,  1], [ 1,  2] ]
  KING_DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1], [-1, -1], [-1, 1], [1, 1], [1, -1]]

  def knight_dirs
    KNIGHT_DIRS
  end

  def king_dirs
    KING_DIRS
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
