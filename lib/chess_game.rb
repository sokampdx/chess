require "chess_game/version"

module ChessGame
  class Game
    def initialize
    end

    def add_newline(string)
      "#{string}\n"
    end

    def header
      ' ' + Array('a'..'h').join(' ')
    end 

    def divider
      '-'*17
    end 

    def rank(pieces_mapping, rank_no)
      pieces = pieces_mapping.split("")
      pipes = ('|'*9).split('')
      pipes.zip(pieces).flatten.join + " #{rank_no}"
    end

    def empty_rank(rank_no)
      '| '*9 + "#{rank_no}"
    end

    def display_board
      dividers = Array.new(9, divider)
      non_dividers = [ 
        header, 
        rank('RNBQKBNR', 8),
        rank('P'*8, 7),
        empty_rank(6),
        empty_rank(5),
        empty_rank(4),
        empty_rank(3),
        rank('p'*8, 2),
        rank('rnbqkbnr', 1)
      ]
      non_dividers.zip(dividers).flatten.join("\n") + "\n"
    end
  end
end
