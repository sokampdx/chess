#require "chess_game/version"

module ChessGame
  class Game
    attr_reader :turn, :player

    def initialize
      @turn = 0
      @player = 'White'
    end

    def display_position
      board = Board.new
      board.display
    end

    def move(chess_move)
      update_game if check_move(chess_move)
    end

    def check_move(chess_move)
    end

    def update_game
      if @player == 'White'
        @player = 'Black'
      else
        @player = 'White'
        @turn += 1
      end
    end
  end
end
