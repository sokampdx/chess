# ChessGame

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/chess_game`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

Base on rule in http://www.chessvariants.com/d.chess/chess.html

Example of the display board layout
```
 a b c d e f g h
-----------------
| | | | | | | | | 8
-----------------
| | | | | | | | | 7
-----------------
| | | | | | | | | 6
-----------------
| | | | | | | | | 5
-----------------
| | | | | | | | | 4
-----------------
| | | | | | | | | 3
-----------------
| | | | | | | | | 2
-----------------
| | | | | | | | | 1
-----------------
```

Keys:

Black use UPPERCASE
White use lowercase

P/p = pawn
R/r = Rook
N/n = Knight
B/b = Bishop
Q/q = Queen
K/k = King

Starting position:
```
 a b c d e f g h
-----------------
|R|N|B|Q|K|B|N|R| 8
-----------------
|P|P|P|P|P|P|P|P| 7
-----------------
| | | | | | | | | 6
-----------------
| | | | | | | | | 5
-----------------
| | | | | | | | | 4
-----------------
| | | | | | | | | 3
-----------------
|p|p|p|p|p|p|p|p| 2
-----------------
|r|n|b|q|k|b|n|r| 1
-----------------
```
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chess_game'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chess_game

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/chess_game.

