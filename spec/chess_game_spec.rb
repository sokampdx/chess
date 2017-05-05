require 'spec_helper'

describe Game do
  let(:game) { Game.new }
  let(:init_position) { File.read("#{File.dirname(__FILE__)}/supports/initial_game_position") }

  it 'creates a new game' do
    game = Game.new
  end

  it 'starts with an initial board setup' do
    expect(game.display_position).to eq(init_position)
  end
end
