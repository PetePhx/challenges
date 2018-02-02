=begin

Pythagorean Triplet

A Pythagorean triplet is a set of three natural numbers, {a, b, c}, for which,
a**2 + b**2 = c**2.

For example, 3**2 + 4**2 = 9 + 16 = 25 = 5**2.

=end

class Triplet
  def initialize(*nums)
    @nums = nums.sort
  end

  def sum
    @nums.sum
  end

  def product
    @nums.reduce(:*)
  end

  def pythagorean?
    @nums[0]**2 + @nums[1]**2 == @nums[2]**2
  end

  def self.where(min_factor: 1, max_factor: 10, sum: nil)
    (min_factor..max_factor).to_a.combination(3)
                            .select { |a, b, c| c < a + b }
                            .map { |a, b, c| new(a, b, c) }
                            .select { |trp| sum.nil? ? true : trp.sum == sum }
                            .select(&:pythagorean?)
  end
end
