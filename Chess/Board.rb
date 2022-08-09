require_relative "Piece"

class Board
  def self.within_board?(pos)
    pos.each { |dim| return false if dim < 0 || dim > 7 }
    true
  end

  def self.fill_board(board)
    piece_rows = [0, 1, 6, 7]
    board.map!.with_index do |row, i|
      row.map!.with_index {| square, j| square = Rook.new("black", board, [i, j]) if piece_rows.include?(i) }
    end
  end

  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
    Board.fill_board(@board)
  end

  def move_piece(start_pos, end_pos)
    return false if empty?(start_pos) || !Board.within_board?(end_pos)
    piece = self[start_pos]
    self[end_pos] = piece
    self[start_pos] = nil
    true
  end

  def empty?(pos)
    return true if pos == nil
    false
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @board[row][col] = val
  end

end


