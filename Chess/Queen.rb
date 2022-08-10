require_relative "Piece"

class Queen < Piece
    include Slidable
  
    def move_dirs
      diagonal_dirs + horizontal_dirs
    end
end