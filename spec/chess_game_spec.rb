require 'spec_helper'

describe Game do
  let(:game) { Game.new }
  let(:init_position) { File.read("#{File.dirname(__FILE__)}/supports/initial_game_position") }

  it 'creates a new game' do
    game = Game.new
  end

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

    before(:each) do
      allow(game).to receive(:check_move).with(valid_move1).and_return(true)
      allow(game).to receive(:check_move).with(invalid_move1).and_return(false)
    end

    describe 'when given valid moves' do
      it 'updates game stat' do
        expect(game).to receive(:update_game)
        game.move(valid_move1)
      end
    end

    describe 'when given invalid moves' do
      it 'does not updates game stat' do
        expect(game).to_not receive(:update_game)
        game.move(invalid_move1)
      end
    end
  end

  describe '.update_game' do
    it 'changes alternating player color' do
      expect { game.update_game }.to change { game.player }.from('White').to('Black')
      expect { game.update_game }.to change { game.player }.from('Black').to('White')
    end

    it 'changes turns only if current player is black' do
      expect { game.update_game }.to_not change { game.turn }
      expect { game.update_game }.to change { game.turn }.from(0).to(1)
    end
  end
end
