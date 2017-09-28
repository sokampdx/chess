require 'spec_helper'

describe Game do
  let(:game) { Game.new }
  let(:init_position) { File.read("#{File.dirname(__FILE__)}/supports/initial_game_position") }

  describe '.display_position' do
    it 'starts with an initial board setup' do
      expect(game.display_position).to eq(init_position)
    end
  end

  describe '.turn' do
    it 'starts with turn 0' do
      expect(game.turn).to eq(0)
    end
  end

  describe '.player' do
    it 'start with white' do
      expect(game.player).to eq('White')
    end
  end

  describe '.move' do
    let(:valid_move1) { 'e2e4' }
    let(:invalid_move1) { 'a1a2' }
    let(:end_move1) { 'f2f3' }
    let(:end_move2) { 'e7e5' }
    let(:end_move3) { 'g2g4' }
    let(:end_move4) { 'd8h4' }

    before(:each) do
      allow(game).to receive(:check_move).with(valid_move1).and_return(true)
      allow(game).to receive(:check_move).with(invalid_move1).and_return(false)
      board = object_double(ChessGame::Board.new, :update => true)
    end

    describe 'when given valid moves' do
      it 'updates game stat' do
        expect(game).to receive(:update_stat)
        game.move(valid_move1)
      end

      describe 'without ending condition' do
        xit { expect(game).to receive(:checkmate?).and_return(false) }
      end
    end

    describe 'when given invalid moves' do
      it 'does not updates game stat' do
        expect(game).to_not receive(:update_stat)
        game.move(invalid_move1)
      end
    end
  end

  describe '.update_stat' do
    it 'changes alternating player color' do
      expect { game.update_stat }.to change { game.player }.from('White').to('Black')
      expect { game.update_stat }.to change { game.player }.from('Black').to('White')
    end

    it 'changes turns only if current player is black' do
      expect { game.update_stat }.to_not change { game.turn }
      expect { game.update_stat }.to change { game.turn }.from(0).to(1)
    end
  end

  describe '.end_game?' do
    before(:each) do
      allow(game).to receive(:checkmate?).and_return(false)
      allow(game).to receive(:draw?).and_return(false)
      allow(game).to receive(:resign?).and_return(false)
    end

    describe 'when game is not done' do
      it { expect(game.end_game?).to be_falsy }
    end

    describe 'when game is done' do
      it 'returns true for resign' do
        allow(game).to receive(:resign?).and_return(true)
        expect(game.end_game?).to be_truthy
      end

      it 'returns true for draw' do
        allow(game).to receive(:draw?).and_return(true)
        expect(game.end_game?).to be_truthy
      end

      it 'returns true for checkmate' do
        allow(game).to receive(:checkmate?).and_return(true)
        expect(game.end_game?).to be_truthy
      end
    end
  end
end
