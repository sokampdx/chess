require "chess_game/version"
require 'board'

module ChessGame
  class Game
    def initialize
    end

    def display_position
      board = Board.new
      board.positions
    end
  end
end
