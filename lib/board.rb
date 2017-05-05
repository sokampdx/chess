module ChessGame
  class Board
    def initialize
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

    def positions(position_map = 'rnbqkbnrpppppppp                                PPPPPPPPRNBQKBNR')
      rank_map = position_map.scan(/.{8}/)
      rank_no = [*1..8]
      ranks = rank_map.zip(rank_no).map { |pieces, num| rank(pieces, num) }
      dividers = Array.new(9, divider)
      non_dividers = [header] + ranks.reverse
      non_dividers.zip(dividers).flatten.join("\n") + "\n"
    end
  end
end
