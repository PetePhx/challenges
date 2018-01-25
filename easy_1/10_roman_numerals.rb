=begin

Roman Numerals

Convert Integer to Roman Numerals

=end

class Integer
  ONES = ['I', 'X', 'C', 'M']
  FIVES = ['V', 'L', 'D', '']

  def to_roman
    self.digits.map.with_index do |d, idx|
      case d <=> 4
      when -1 then ONES[idx] * d
      when 0 then ONES[idx] + FIVES[idx]
      when 1
        d == 9 ? ONES[idx] + ONES[idx + 1] : FIVES[idx] + ONES[idx] * (d - 5)
      end
    end.reverse.join
  end
end

# [1, 4, 5, 9, 10, 40, 49, 50, 99, 100, 435, 583,
#   999, 1000, 1111, 2222, 2895, 3999].each do |n|
#   puts n.to_s + " : " + n.to_roman
# end
