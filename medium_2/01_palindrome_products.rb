=begin

Palindrome Products

Write a program that can detect palindrome products in a given range.

A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers (range 10 ~ 99) is 9009 = 91 x 99.

=end

class PalNumber
  include Comparable
  attr_accessor :value, :factors
  def initialize(val, factors_arr)
    @value = val
    @factors = [factors_arr]
  end

  def append_factors(factors_arr)
    @factors << factors_arr
  end

  def <=>(other)
    value <=> other.value
  end
end

class Palindromes
  def initialize(max_factor:, min_factor: 1)
    @max = max_factor
    @min = min_factor
    @list = []
  end

  def generate
    (@min..@max).to_a.repeated_combination(2) do |i, j|
      k = i * j
      if palindrome?(k)
        idx = @list.index { |obj| obj.value == k }
        if idx
          @list[idx].append_factors([i, j])
        else
          @list << PalNumber.new(k, [i, j])
        end
      end
    end
  end

  def palindrome?(num)
    num.digits.reverse == num.digits
  end

  def largest
    @list.max
  end

  def smallest
    @list.min
  end
end
