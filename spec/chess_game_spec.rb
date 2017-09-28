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
    describe 'when given valid moves' do

      let(:valid_move1) { 'e2e4' }
      let(:valid_move2) { 'e7e5' }
      let(:valid_move3) { 'd2d4' }

      it 'changes alternating player color' do
        expect { game.move(valid_move1) }.to change { game.player }.from('White').to('Black')
        expect { game.move(valid_move2) }.to change { game.player }.from('Black').to('White')
        expect { game.move(valid_move3) }.to change { game.player }.from('White').to('Black')
      end

      it 'changes turns only after black moves' do
        expect { game.move(valid_move1) }.to_not change { game.turn }
        expect { game.move(valid_move2) }.to change { game.turn }.from(0).to(1)
        expect { game.move(valid_move3) }.to_not change { game.turn }
      end
    end
  end
end
