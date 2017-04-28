require 'spec_helper'

describe Board do
  let(:initial_board) { 
<<EOF
 a b c d e f g h
-----------------
|R|N|B|Q|K|B|N|R| 8
-----------------
|P|P|P|P|P|P|P|P| 7
-----------------
| | | | | | | | | 6
-----------------
| | | | | | | | | 5
-----------------
| | | | | | | | | 4
-----------------
| | | | | | | | | 3
-----------------
|p|p|p|p|p|p|p|p| 2
-----------------
|r|n|b|q|k|b|n|r| 1
-----------------
EOF
  }

  let(:board) { Board.new }

  context 'board elements' do
    it 'creates header' do
      expect(board.header).to eq(' a b c d e f g h')
    end

    it 'creates divider' do
      expect(board.divider).to eq('-----------------')
    end

    it 'creates empty rank' do
      expect(board.empty_rank(8)).to eq('| | | | | | | | | 8')
    end 

    it 'creates non-empty rank' do
      expect(board.rank('pppppppp', 7)).to eq('|p|p|p|p|p|p|p|p| 7')
    end
  end

  context 'no argument supply' do
    it 'creates initial board position' do
      expect(board.positions).to eq(initial_board)
    end
  end
end
