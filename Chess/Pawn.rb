class Pawn < Piece

  INITIAL_DIRS_BLACK = [[1, 0], [2, 0]]
  INITIAL_DIRS_WHITE = [[-1, 0], [-2, 0]]
  REGULAR_DIRS_BLACK = [[1, 0]]
  REGULAR_DIRS_WHITE = [[-1, 0]]
  TAKE_DIRS_BLACK = [[1, 1], [1 -1]]
  TAKE_DIRS_WHITE = [[-1, -1], [-1, 1]]

  def initialize(color, board, pos)
    @first_move = true
    super(color, board, pos)
  end

  def move_dirs
    if color == :black
      if @first_move
        opposite_squares
      else
        REGULAR_DIRS_BLACK + opposite_squares
      end

    else
      if @first_move
        INITIAL_DIRS_WHITE + opposite_squares
      else
        REGULAR_DIRS_WHITE + opposite_squares
      end
    end
  end

  def opposite_squares #(pos, @board)
    possible_squares = []

    if @color == :black
      diagonals = [[1, 1], [1, -1]]

      diagonals.each do |diagonal|
        potential_pos = Piece.add_pos(diagonal, @pos)
        possible_squares << potential_pos if @board[potential_pos].color == :white
      end

    else
      diagonals = [[-1, -1], [-1, 1]]

      diagonals.each do |diagonal|
        potential_pos = Piece.add_pos(diagonal, @pos)
        possible_squares << potential_pos if @board[potential_pos[0]][potential_pos[1]].color == :black
      end
    end
    possible_squares
  end

end