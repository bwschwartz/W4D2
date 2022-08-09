class Board
  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @board[row][col] = val
  end

  def move_piece(color, start_pos, end_pos)
  end

  def valid_pos?(pos)
  end

end