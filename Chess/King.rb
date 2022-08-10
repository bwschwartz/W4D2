require_relative "Piece"

class King < Piece
    include Stepable
    def move_dirs
      king_dirs
    end
end