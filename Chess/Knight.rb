require_relative "Piece"

class Knight < Piece

    include Stepable

    def initialize (color, board, pos)
      super(color, board, pos)
      @symbol = :knight
    end


    def move_dirs
      knight_dirs
    end

end