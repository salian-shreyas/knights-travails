# class represent square in chess-board
class Square
  attr_accessor :data, :next

  def initialize(data = nil, next_node = nil)
    @data = data
    @next = next_node
  end
end
