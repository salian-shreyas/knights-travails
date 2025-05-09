# class for knights path
class Knights
  def initialize(coordinates)
    @coordinates = coordinates
    @short_path = []
  end

  def path(destination)
    search_path(destination)
    print_path
  end

  private

  def print_path
    p @short_path
  end

  def search_path(destination, start = @coordinates, current_path = [])
    return if longer_path?(current_path)

    current_path << start
    if destination_reached?(start, destination)
      @short_path = current_path
    else
      search_immediate_path(destination, start, current_path)
    end
  end

  def search_immediate_path(destination, start, current_path)
    immediate_squares(Square.new(start)).each do |square|
      search_path(destination, square.data, current_path.dup) unless current_path.include? square.data
    end
  end

  def longer_path?(current_path)
    return false if @short_path.empty?

    current_path.length >= @short_path.length
  end

  def destination_reached?(start, destination)
    start == destination
  end

  def immediate_squares(square)
    squares = []
    possible_moves(square).each do |move|
      squares << Square.new(move, square.next) if valid?(move)
    end

    squares
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
end
