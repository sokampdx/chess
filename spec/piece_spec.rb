require 'spec_helper'

describe Piece do
  let(:init_position) { 'rnbqkbnrpppppppp                                PPPPPPPPRNBQKBNR' }
  let(:init_position) { 'rnbqkbnrpppppppp            P                   PPPP PPPRNBQKBNR' }
  let(:norm_position) { 'rnbqkbnrpppp ppp            p                   PPPPPPPPRNBQKBNR' }
  let(:game) { Class.new { include Rules } }

  context '.move' do
    let(:normal_move) { 'e2e4' }
    
    xit 'moves normal pieces' do
      expect(game.new.move(init_position, normal_move)).to eq(norm_position)
    end

    xit 'moves ' do
      expect(game.new.move(init_position, a_move)).to eq()
    end
  end
end
