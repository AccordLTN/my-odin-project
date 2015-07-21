require "spec_helper"
 
module TicTacToe
  describe Board do
 
    context "#initialize" do
      it "initializes the board with a grid" do
        expect { Board.new(grid: "grid") }.to_not raise_error
      end

      it "sets the grid with three rows by default" do
        board = Board.new
        expect(board.grid.length).to eq(3)
      end
       
      it "creates three things in each row by default" do
        board = Board.new
        board.grid.each do |row|
          expect(row.length).to eq(3)
        end
      end
    end
 
    context "#grid" do
      it "returns the grid" do
        board = Board.new(grid: "blah")
        expect(board.grid).to eq "blah"
      end
    end

    context "#get_cell" do
      it "returns the cell based on the (x, y) coordinate" do
        grid = [["", "", ""], ["", "", "something"], ["", "", ""]]
        board = Board.new(grid: grid)
        expect(board.get_cell(2, 1)).to eq "something"
      end
    end

  end
end