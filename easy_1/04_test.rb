require 'minitest/autorun'
require_relative '04_trinary'

class TrinaryTest < Minitest::Test
  def test_trinary_1_is_decimal_1
    assert_equal 1, Trinary.new('1').to_decimal
  end

  def test_trinary_2_is_decimal_2
    assert_equal 2, Trinary.new('2').to_decimal
  end

  def test_trinary_10_is_decimal_3
    assert_equal 3, Trinary.new('10').to_decimal
  end

  def test_trinary_11_is_decimal_4
    assert_equal 4, Trinary.new('11').to_decimal
  end

  def test_trinary_100_is_decimal_9
    assert_equal 9, Trinary.new('100').to_decimal
  end

  def test_trinary_112_is_decimal_14
    assert_equal 14, Trinary.new('112').to_decimal
  end

  def test_trinary_222_is_26
    assert_equal 26, Trinary.new('222').to_decimal
  end

  def test_trinary_1122000120_is_32091
    assert_equal 32_091, Trinary.new('1122000120').to_decimal
  end

  def test_invalid_trinary_is_decimal_0
    assert_equal 0, Trinary.new('carrot').to_decimal
  end

  def test_invalid_trinary_with_digits_is_decimal_0
    assert_equal 0, Trinary.new('0a1b2c').to_decimal
  end

  def test_trinary_minus_2_is_decimal_minus_2
    assert_equal -2, Trinary.new('-2').to_decimal
  end

  def test_trinary_minus_222_is_minus_26
    assert_equal -26, Trinary.new('-222').to_decimal
  end

  def test_invalid_just_negative_sign
    assert_equal 0, Trinary.new('-').to_decimal
  end

  def test_invalid_empty_string
    assert_equal 0, Trinary.new('').to_decimal
  end
end

# # Running:
#
# ............................
#
# Finished in 0.028091s, 498.3792 runs/s, 498.3792 assertions/s.
#
# 14 runs, 14 assertions, 0 failures, 0 errors, 0 skips
# ]2;[Minitest results] 14 tests
#
#
# Finished in 0.462651s, 30.2604 runs/s, 30.2604 assertions/s.
# 14 runs, 14 assertions, 0 failures, 0 errors, 0 skips
#
#
# Finished in 0.317455s, 40.9506 runs/s, 40.9506 assertions/s.
# 13 runs, 13 assertions, 0 failures, 0 errors, 0 skips
