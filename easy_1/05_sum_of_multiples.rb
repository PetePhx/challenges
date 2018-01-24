=begin

Sum of Multiples

Write a program that, given a number, can find the sum of all the multiples of
particular numbers up to but not including that number.

If we list all the natural numbers up to but not including 20 that are multiples
of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these
multiples is 78.

Write a program that can find the sum of the multiples of a given set of numbers.
If no set of numbers is given, default to 3 and 5.

=end

=begin
  #to and ::to are instance and class methods
  with no instantiation, ::to should operate based on default (3, 5) multiples.
=end

class SumOfMultiples
  def initialize(*mults)
    @arr = (mults.empty? ||
      mults.include?(0) ||
      mults.any? { |k| !k.is_a?(Integer) } ? [3, 5] : mults)
  end

  def self.to(n)
    self.new(3, 5).to(n)
  end

  def to(n)
    multiples = []
    @arr.each { |k| multiples << 1.upto(n / k).map { |elm| elm * k } }
    (multiples.flatten.sort.uniq - [n]).sum
  end
end

# p SumOfMultiples.to(10)
# p SumOfMultiples.new(3).to(10)
# p SumOfMultiples.new(0).to(10)
# p SumOfMultiples.new(Math::PI).to(10)
# p SumOfMultiples.new("hello").to(10)
# p SumOfMultiples.new(:okie_dokie).to(10)
