module ChessGame
  class Board
    def initialize(position = 'rnbqkbnrpppppppp                                PPPPPPPPRNBQKBNR')
      @position = position
    end

    def header
      ' ' + Array('a'..'h').join(' ')
    end

    def divider
      '-'*17
    end 

    def empty_rank(rank_no)
      rank(" "*8, rank_no)
    end

    def rank(pieces_mapping, rank_no)
      pieces = pieces_mapping.split("")
      pipes = ('|'*9).split('')
      pipes.zip(pieces).flatten.join + " #{rank_no}"
    end 

    def piece_map
      @position.scan(/.{8}/)
    end

    def display
      rank_map = piece_map
      rank_no = [*1..8]
      ranks = rank_map.zip(rank_no).map { |pieces, num| rank(pieces, num) }
      dividers = Array.new(9, divider)
      non_dividers = [header] + ranks.reverse
      non_dividers.zip(dividers).flatten.join("\n") + "\n"
    end
  end

  class UnicodeBoard < Board
    def piece_map
      @position
        .gsub('p', "\u2659").gsub('P', "\u265F")
        .gsub('r', "\u2656").gsub('R', "\u265C")
        .gsub('n', "\u2658").gsub('N', "\u265E")
        .gsub('b', "\u2657").gsub('B', "\u265D")
        .gsub('q', "\u2655").gsub('Q', "\u265B")
        .gsub('k', "\u2654").gsub('K', "\u265A")
        .scan(/.{8}/)
    end
  end
end
