#!/usr/bin/env ruby

require "./path"

def main
  game = Chess::Game.new
  puts game.display_position
end

main if __FILE__ == $0
