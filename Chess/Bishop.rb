require_relative "Piece"

class Bishop < Piece
    include Slidable

    def initialize (color, board, pos)
      super(color, board, pos)
      @symbol = :bishop
    end

    def move_dirs
      diagonal_dirs
    end
end
