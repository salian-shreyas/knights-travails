# class for knights path
class Knights
  def initialize
    @board = build_board
  end

  private

  def build_board
    @board = Array.new(64)

    @board.each_index do |idx|
      current_square = Square.new(square_coordinates(idx))
      board[idx] = immediate_squares(current_square)
    end
  end

  def immediate_squares(square)
    possible_moves(square).each do |move|
      square.next = Square.new(move, square.next) if valid?(move)
    end

    square
  end

  def possible_moves(square)
    row = square.data[0]
    col = square.data[1]

    [
      [row + 1, col + 2],
      [row + 1, col - 2],
      [row - 1, col + 2],
      [row - 1, col - 2],
      [row + 2, col + 1],
      [row + 2, col - 1],
      [row - 2, col + 1],
      [row - 2, col - 1]
    ]
  end

  def valid?(move)
    move[0].between?(0, 7) && move[1].between?(0, 7)
  end

  def square_coordinates(idx)
    row = case idx
          when 0..7 then 0
          when 8..15 then 1
          when 16..23 then 2
          when 24..31 then 3
          when 32..39 then 4
          when 40..47 then 5
          when 48..55 then 6
          else 7
          end

    col = idx % 8

    [row, col]
  end
end
