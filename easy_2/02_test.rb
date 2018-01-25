require 'minitest/autorun'
require_relative '02_scrabble_score'

class ScrabbleTest < Minitest::Test
  def test_empty_word_scores_zero
    assert_equal 0, Scrabble.new('').score
  end

  def test_whitespace_scores_zero
    assert_equal 0, Scrabble.new(" \t\n").score
  end

  def test_nil_scores_zero
    assert_equal 0, Scrabble.new(nil).score
  end

  def test_scores_very_short_word
    assert_equal 1, Scrabble.new('a').score
  end

  def test_scores_other_very_short_word
    assert_equal 4, Scrabble.new('f').score
  end

  def test_simple_word_scores_the_number_of_letters
    assert_equal 6, Scrabble.new('street').score
  end

  def test_complicated_word_scores_more
    assert_equal 22, Scrabble.new('quirky').score
  end

  def test_scores_are_case_insensitive
    assert_equal 41, Scrabble.new('OXYPHENBUTAZONE').score
  end

  def test_convenient_scoring
    assert_equal 13, Scrabble.score('alacrity')
  end
end

# # Running:
#
# ..................
#
# Finished in 0.028079s, 320.5197 runs/s, 320.5197 assertions/s.
#
# 9 runs, 9 assertions, 0 failures, 0 errors, 0 skips
# ]2;[Minitest results] 9 tests
#
#
# Finished in 0.273885s, 32.8606 runs/s, 32.8606 assertions/s.
# 9 runs, 9 assertions, 0 failures, 0 errors, 0 skips
