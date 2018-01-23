=begin

Series

Write a program that will take a string of digits and give you all the possible
consecutive number series of length n in that string.

For example, the string "01234" has the following 3-digit series:

- 012
- 123
- 234

And the following 4-digit series:

- 0123
- 1234

And if you ask for a 6-digit series from a 5-digit string, you deserve whatever
you get.

=end

=begin
  - input: string (self), positive integer n
  - output: array
    -all sequences of integers of length n

  - Algo
    - #scan through the string
    - look for regexp matches of n consequtive digits
      - /\d{#{n}}/
    - return each in an arra of integers
    - return the array of arrays
=end

class Series
  def initialize(str)
    @string = str
  end

  def slices(n)
    raise ArgumentError unless n.is_a?(Integer) && n > 0 && n <= @string.size
    0.upto(@string.size - n).with_object([]) do |idx, arr|
      arr << @string[idx, n].chars.map(&:to_i) if @string[idx, n].match(/\d{#{n}}/)
    end
  end
end
