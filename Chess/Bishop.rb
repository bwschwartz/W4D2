require_relative "Piece"

class Bishop < Piece

    include Slidable
  
    def move_dirs
      diagonal_dirs
    end
end
  