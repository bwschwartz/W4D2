require_relative "Piece" 

class Rook < Piece
    include Slidable
  
    def move_dirs
      horizontal_dirs
    end
  
end