require_relative "Piece"

class Knight < Piece

    include Stepable
  
    def move_dirs
      knight_dirs
    end
  
end