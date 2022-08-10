require_relative "Piece"

class Rook < Piece
    include Slidable

    def initialize (color, board, pos)
      super(color, board, pos)
      color == :white ? @symbol = " ♖ " : @symbol = " ♜ " 
    end


    def move_dirs
      horizontal_dirs
    end

end