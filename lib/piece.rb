module Chess
  class Piece
    def move(init_position, a_move)
      from, to = parse_move(a_move)

      next_position = init_position
      piece = init_position[from]
      next_position[from] = " "
      next_position[to] = piece

      next_position
    end

    def parse_move(a_move)
      from, to = a_move.downcase.scan(/.{2}/)
      return parse_index(from), parse_index(to)
    end

    def parse_index(square)
      x, y = square.split('')
      x = x.ord - 'a'.ord
      y = y.to_i - 1
      y * 8 + x
    end
  end
end
