#require "chess/version"

module Chess
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

    def game_start_message
      <<HERE
      Game Begin
HERE
    end

    def game_end_message
      return resign_message if resign?
      return draw_message if draw?
      return checkmate_message if checkmate?
    end

    def run
      puts game_start_message
      unless end_game?
        puts display_position
        puts before_move_message
        user_input = get
        move(user_input)
        puts after_move_message
      end
      puts game_end_message
    end
  end
end
