require_relative "Piece"

class King < Piece
    include Stepable

    def initialize (color, board, pos)
      super(color, board, pos)
      @symbol = :king
    end

    def move_dirs
      king_dirs
    end
end