require_relative "Piece"

class Queen < Piece
    include Slidable

    def initialize (color, board, pos)
      super(color, board, pos)
      @symbol = :queen
    end


    def move_dirs
      diagonal_dirs + horizontal_dirs
    end
end