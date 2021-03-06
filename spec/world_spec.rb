require './lib/world'

describe World do

  let(:alive) { double(:alive? => true) }
  let(:dead)  { double(:alive? => false) }

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

  it "reports width" do
    expect(subject.width).to eq 5
  end

  it "reports height" do
    expect(subject.height).to eq 4
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

    it "evolves every cell" do
      fake_cells = [
        [double.as_null_object, double.as_null_object],
        [double.as_null_object, double.as_null_object],
      ]

      world = World.new(fake_cells)
      world.next

      fake_cells.each do |row|
        row.each do |cell|
          expect(cell).to have_received(:evolve)
        end
      end
    end
  end

end
