require_relative "Piece"

class Rook < Piece
    include Slidable

    def initialize (color, board, pos)
      super(color, board, pos)
      @symbol = :rook
    end


    def move_dirs
      horizontal_dirs
    end

end