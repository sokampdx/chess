#require "chess_game/version"

module ChessGame
  class Game
    def initialize
    end

    def display_position
      board = Board.new
      board.display
    end
  end
end
