require 'gol'

describe GameOfLife do
  it "paints a pretty picture" do
    game = GameOfLife.new [
      [0,0,0],
      [1,1,1],
      [0,0,0]
    ]

    expected = "000\n111\n000"
    expect(game.inspect).to eq expected
  end

  it "can change position values" do
    game = GameOfLife.new [
      [0,0,0],
      [1,1,1],
      [0,0,0]
    ]

    game.iterate!
    # called a flipper
    # it iterates back and forth in a plus forever
    expected = "010\n010\n010"
    expect(game.inspect).to eq expected
  end

  it 'will kill a lonely cell' do
    game = GameOfLife.new [
      [1,0,0],
      [0,0,0],
      [0,0,0]
    ]

    game.iterate!

    expected = "000\n000\n000"
    expect(game.inspect).to eq expected
  end

  it "will create a live cell if more than one lonely cell exists in a row" do
    game = GameOfLife.new [
      [0,0,0],
      [1,1,1],
      [0,0,0]
    ]

    game.tick!
    expected = [
                [1,0,0],
                [1,1,1],
                [1,0,0]
              ]
    expect(game.inspect).to eq expected
  end
end
