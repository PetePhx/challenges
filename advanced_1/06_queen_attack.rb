=begin

Queen Attack

In the game of chess, a queen can attack pieces which are on the same row,
column, or diagonal.

A chessboard can be represented by an 8 by 8 array.

So if you're told the white queen is at (2, 3) and the black queen at (5, 6),
then you'd know you've got a set-up like so:

_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ W _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ B _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _

You'd also be able to answer whether the queens can attack each other. In this
case, that answer would be yes, they can, because both pieces share a diagonal.

=end

class Queens
  attr_reader :white, :black
  def initialize(white: [0, 3], black: [7, 3])
    validate_input(white, black)
    @white = white
    @black = black
  end

  def to_s
    arr = Array.new(8) { ['_'] * 8 }
    arr[white[0]][white[1]] = 'W'
    arr[black[0]][black[1]] = 'B'
    arr.map { |row| row.join(' ') }.join("\n")
  end

  def attack?
    @white[0] == @black[0] ||
      @white[1] == @black[1] ||
      (@white[0] - @black[0]).abs == (@white[1] - @black[1]).abs
  end

  def validate_input(w, b)
    raise ArgumentError if w == b ||
                           [w, b].flatten.any? { |z| !(0..7).cover?(z) }
  end
end
