# class for knights path
class Knights
  def initialize(coordinates)
    @coordinates = coordinates
    @short_path = []
  end

  def path(destination)
    search_path(destination)

    @short_path
  end

  private

  def search_path(destination, start = @coordinates, current_path = [])
    return if longer_path?(current_path)

    current_path << start
    if start == destination
      @short_path = current_path
    else
      search_immediate_path(destination, start, current_path)
    end
  end

  def search_immediate_path(destination, start, current_path)
    immediate_squares(start).each do |square|
      search_path(destination, square, current_path.dup) unless current_path.include? square
    end
  end

  def longer_path?(current_path)
    return false if @short_path.empty?

    current_path.length >= @short_path.length
  end

  def immediate_squares(square)
    possible_moves(square).each_with_object([]) do |move, squares|
      squares << move if valid?(move)
    end
  end

  def possible_moves(square)
    row = square[0]
    col = square[1]

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
