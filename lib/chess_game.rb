#require "chess_game/version"

module ChessGame
  class Game
    attr_reader :turn, :player

    def initialize
      @turn = 0
      @player = 'White'
      @board = Board.new
    end

    def display_position
      @board.display
    end

    def move(chess_move)
      if check_move(chess_move)
        update_stat
        @board.update(chess_move)
      end
    end

    def update_game(chess_move)
    end

    def check_move(chess_move)
    end

    def update_stat
      if @player == 'White'
        @player = 'Black'
      else
        @player = 'White'
        @turn += 1
      end
    end

    def end_game?
      checkmate? || draw? || resign?
    end

    def checkmate?
    end

    def draw?
    end

    def resign?
    end
  end
end
