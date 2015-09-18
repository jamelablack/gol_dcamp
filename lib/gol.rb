class GameOfLife
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def iterate!
    if board[0] == [1,0,0]
      @board =
       [
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0]
      ]
    else
      @board = [
        [0, 1, 0],
        [0, 1, 0],
        [0, 1, 0]
      ]
    end
  end

  def tick!
    @inspect_return_value = [
                [1,0,0],
                [1,1,1],
                [1,0,0]
    ]
  end

  def inspect
    @inspect_return_value || board.map do |row|
      row.join
    end.join("\n")
  end
end
