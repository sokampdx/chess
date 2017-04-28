require 'spec_helper'

INITIAL_BOARD_SETUP= <<EOF
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

describe Game do
  let(:game) { Game.new }

  it 'creates a new game' do
    game = Game.new
  end

  it 'starts with an initial board setup' do
    expect(game.display_position).to eq(INITIAL_BOARD_SETUP)
  end
end
