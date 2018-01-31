=begin

Pascal's Triangle

Write a program that computes Pascal's triangle up to a given number of rows.

In Pascal's Triangle each number is computed by adding the numbers to the right
and left of the current position in the previous row.

    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
# ... etc

=end

=begin

- type: class: Triangle. initialize with # of rows
- method: instance method: rows
- input: nothing
- output: array of arrays: one row/array for each row of pascal triangle

- algo:
  recursion: if row # is 1, return [1]
  otherwise: for (n + 1)'th row:
    - calculate a + b for row n each_cons(2)
    - append 1 beginning and end
    - return array
=end

class Triangle
  def initialize(num_rows)
    @num_rows = num_rows
  end

  def rows
    1.upto(@num_rows).with_object([]) { |n, obj| obj << nth_row(n) }
  end

  def nth_row(n)
    return [1] if n == 1
    nth_row(n - 1).each_cons(2)
                  .with_object([1]) { |(a, b), obj| obj << a + b } << 1
  end
end
