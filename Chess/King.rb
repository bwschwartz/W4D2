require_relative "Piece"

class King < Piece
    include Stepable

    def initialize (color, board, pos)
      super(color, board, pos)
      color == :white ? @symbol = " ♔ " : @symbol = " ♚ " 
    end

    def move_dirs
      king_dirs
    end
end