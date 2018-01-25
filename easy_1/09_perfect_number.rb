=begin

Perfect Number

The Greek mathematician Nicomachus devised a classification scheme for natural
numbers, identifying each as belonging uniquely to the categories of abundant,
perfect, or deficient. A perfect number equals the sum of its positive divisors
— the pairs of numbers whose product yields the target number, excluding the
number itself. This sum is known as the Aliquot sum.

    Perfect: Sum of factors = number
    Abundant: Sum of factors > number
    Deficient: Sum of factors < number

Examples:

    6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
    28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
    Prime numbers 7, 13, etc are deficient by the Nicomachus classification.

Write a program that can tell if a number is perfect, abundant or deficient.

=end

class PerfectNumber
  def self.classify(num)
    raise RuntimeError if !num.is_a?(Integer) || num < 1

    case self.proper_divisors(num).sum <=> num
    when -1 then 'deficient'
    when 0 then 'perfect'
    when 1 then 'abundant'
    end
  end

  def self.proper_divisors(n)
    (1..n/2).each_with_object([]) { |i, arr| arr << i  if n % i == 0 }
  end
end
