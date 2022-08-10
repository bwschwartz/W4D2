require_relative "Piece"

class Bishop < Piece
    include Slidable

    def initialize (color, board, pos)
      super(color, board, pos)
      color == :white ? @symbol = " ♗ " : @symbol = " ♝ " 
    end

    def move_dirs
      diagonal_dirs
    end
end
