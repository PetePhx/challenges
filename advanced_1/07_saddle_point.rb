=begin

Saddle Point

Write a program that detects saddle points in a matrix.

So say you have a matrix like so:

    0  1  2
  |---------
0 | 9  8  7
1 | 5  3  2     <--- saddle point at (1,0)
2 | 6  6  7

It has a saddle point at (1, 0).

It's called a "saddle point" because it is greater than or equal to every
element in its row and the less than or equal to every element in its column.

A matrix may have zero or more saddle points.

Your code should be able to provide the (possibly empty) list of all the saddle
points for any given matrix.

Note that you may find other definitions of matrix saddle points online, but the
tests for this exercise follow the above unambiguous definition.

=end

class Matrix
  attr_reader :rows, :columns
  def initialize(str)
    @rows = str.split("\n").map(&:split).map { |arr| arr.map(&:to_i) }
    @columns = @rows.transpose
    find_row_column_min_max
  end

  def saddle_points
    rows.each_index.with_object([]) do |i, obj|
      rows[i].each_index { |j| obj << [i, j] if saddle_point?(i, j) }
    end
  end

  def saddle_point?(i, j)
    rows[i][j] == @row_max[i] && rows[i][j] == @col_min[j]
  end

  def find_row_column_min_max
    @row_max = rows.map(&:max)
    @col_min = columns.map(&:min)
  end
end
