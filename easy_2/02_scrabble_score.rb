=begin

Scrabble Score

Write a program that, given a word, computes the scrabble score for that word.
Letter Values

You'll need these:

Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10

Examples

"cabbage" should be scored as worth 14 points:

    3 points for C
    1 point for A, twice
    3 points for B, twice
    2 points for G
    1 point for E

And to total:

    3 + 2*1 + 2*3 + 2 + 1
    = 3 + 2 + 6 + 3
    = 5 + 9
    = 14

=end

class Scrabble
  SCORES = Hash.new(0).merge(
    %w[A E I O U L N R S T D G B C M P F H V W Y K J X Q Z]
    .zip([1] * 10 + [2] * 2 + [3] * 4 + [4] * 5 + [5] + [8] * 2 + [10] * 2)
    .to_h
  ).freeze

  def initialize(str)
    @word = str
  end

  def score
    Scrabble.score(@word)
  end

  def self.score(str)
    return 0 unless str.is_a?(String)
    str.chars.map { |c| SCORES[c.upcase] }.sum
  end
end
