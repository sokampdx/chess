require 'spec_helper'

describe Board do
  let(:init_position) { File.read("#{File.dirname(__FILE__)}/supports/initial_game_position") }
  let(:board) { Board.new }

  describe '.header' do
    it { expect(board.header).to eq(' a b c d e f g h') }
  end

  describe '.divider' do
    it { expect(board.divider).to eq('-----------------') }
  end

  describe '.empty_rank' do
    it { expect(board.empty_rank(8)).to eq('| | | | | | | | | 8') }
  end

  describe '.rank' do
    it { expect(board.rank('pppppppp', 7)).to eq('|p|p|p|p|p|p|p|p| 7') }
  end

  describe '.position' do
    context 'when no argument supply' do
      it 'creates initial board position' do
        expect(board.positions).to eq(init_position)
      end
    end

    context 'when supply position argument' do
      let(:empty_game) { " "*64 }
      let(:empty_game_position) { File.read("#{File.dirname(__FILE__)}/supports/empty_game_position") } 

      it 'creates board position' do
        expect(board.positions(empty_game)).to eq(empty_game_position)
      end
    end
  end
end
