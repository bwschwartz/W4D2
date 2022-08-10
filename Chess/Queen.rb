require_relative "Piece"

class Queen < Piece
    include Slidable

    def initialize (color, board, pos)
      super(color, board, pos)
      color == :white ? @symbol = " ♕ " : @symbol = " ♛ " 
    end


    def move_dirs
      diagonal_dirs + horizontal_dirs
    end
end