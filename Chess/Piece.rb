require_relative "Board"

module Slidable

  HORIZONTAL_DIRS = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  DIALGONAL_DIRS = [[-1, -1], [-1, 1], [1, 1], [1, -1]]

  def horizontal_dirs 
    HORIZONTAL_DIRS
  end

  def diagonal_dirs 
    DIALGONAL_DIRS
  end

end 

class Piece
  attr_reader :board

  def initialize (color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def self.add_pos(p1, p2)
    p1.map.with_index { |num, i| num + p2[i] }
  end

  def valid_moves
    hit_end = false
    valid_moves = []

    move_dirs.each do |direction|
      cur_pos = @pos

      until hit_end 
        cur_pos = Piece.add_pos(cur_pos, direction)
        if cur_pos == nil
          valid_moves << cur_pos
          break
        end

        if !Board.within_board?(cur_pos) #|| board[[cur_pos]].color == @color 
          hit_end = true
          break
        end
      end
    end
    valid_moves

  end


  def moves 

  end

end


class Rook < Piece

  include Slidable
  
  # def initialize
  #   super
  # end 

  def move_dirs
    horizontal_dirs
  end

end