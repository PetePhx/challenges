=begin

Minesweeper

Minesweeper is a popular game where the user has to find the mines using numeric
hints that indicate how many mines are directly adjacent (horizontally,
vertically, diagonally) to a square.

In this exercise you have to create some code that counts the number of mines
adjacent to a square and transforms boards like this (where * indicates a mine):

+-----+
| * * |
|  *  |
|  *  |
|     |
+-----+

into this:

+-----+
|1*3*1|
|13*31|
| 2*2 |
| 111 |
+-----+

=end

class ValueError < StandardError; end

class Board
  def self.transform(input)
    verify_input(input)
    matrix = input.map(&:chars)
    matrix.map.with_index do |row, i|
      row.map.with_index do |ch, j|
        if ch == ' '
          c = count_stars(i, j, matrix)
          c.zero? ? ' ' : c.to_s
        else
          ch
        end
      end
    end.map(&:join)
  end

  def self.count_stars(i, j, matrix)
    arr = matrix[i - 1..i + 1].map { |row| row[j - 1..j + 1] }.flatten # 3 x 3
    arr.delete_at(4) # remove center
    arr.count('*')
  end

  def self.verify_input(input)
    raise ValueError unless input.map(&:size).uniq.size == 1 &&
                            input[0].match?(/\A\+\-*\+\z/) &&
                            input[-1].match?(/\A\+\-*\+\z/) &&
                            input[1..-2].all? { |s| s.match?(/\A\|[ \*]*\|\z/) }
  end
end
