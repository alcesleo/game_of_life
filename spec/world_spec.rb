require './lib/world'
require './lib/cell'

describe World do

  # TODO: Stub
  let(:alive) { Cell.alive }
  let(:dead)  { Cell.dead }

  let(:cells) {
    [
      [dead, dead,  dead,  dead, dead],
      [dead, alive, alive, dead, dead],
      [dead, alive, alive, dead, alive],
      [dead, dead,  dead,  dead, dead]
    ]
  }

  subject { World.new(cells) }

  it "has nice inspection output" do
    expect(subject.inspect).to eq "#<World (generation 1)>"
  end

  it "iterates recursively through the cells" do
    subject.each_cell do |cell, x, y|
      expect(cell).to eq cells[y][x]
    end
  end

  context "#number_of_alive_neighbors" do
    it "counts the neighbors of a cell in the middle" do
      expect(subject.number_of_alive_neighbors(1, 1)).to be 3
    end

    it "counts the neighbors of a cell at a low index corner" do
      expect(subject.number_of_alive_neighbors(0, 0)).to be 1
    end

    it "counts the neighbors of a cell at a high index corner" do
      expect(subject.number_of_alive_neighbors(4, 3)).to be 1
    end

  end

  context "#next" do
    it 'increments the generation counter' do
      world = World.new([])
      expect(world.generation).to eq 1
      expect(world.next.generation).to eq 2
      expect(world.generation).to eq 1
    end

    it "correctly iterates a block" do
      world = World.new([
        [dead, dead, dead, dead, dead],
        [dead, dead, alive, dead, dead],
        [dead, dead, alive, dead, dead],
        [dead, dead, alive, dead, dead],
        [dead, dead, dead, dead, dead],
      ])
      expected = [
        [dead, dead, dead, dead, dead],
        [dead, dead, dead, dead, dead],
        [dead, alive, alive, alive, dead],
        [dead, dead, dead, dead, dead],
        [dead, dead, dead, dead, dead],
      ]
      expect(world.next.cells).to eq expected
    end
  end


end
