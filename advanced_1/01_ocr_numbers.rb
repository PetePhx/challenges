=begin

OCR Numbers

Write a program that, given a 3 x 4 grid of pipes, underscores, and spaces, can
determine which number is represented, or whether it is garbled.
Step One

To begin with, convert a simple binary font to a string containing 0 or 1. The
binary font uses pipes and underscores, four rows high and three columns wide.

 _   #
| |  # zero.
|_|  #
     # the fourth row is always blank

Is converted to "0"

   #
|  # one.
|  #
   # (blank fourth row)

Is converted to "1"

If the input is the correct size, but not recognizable, your program should
return '?'. If the input is the incorrect size, your program should return an
error.
Step Two

Update your program to recognize multi-character binary strings, replacing
garbled numbers with ?
Step Three

Update your program to recognize all numbers 0 through 9, both individually and
as part of a larger string.

  _
 _|
|_

Is converted to "2"

  _  _     _  _  _  _  _  _  #
| _| _||_||_ |_   ||_||_|| | # decimal numbers.
||_  _|  | _||_|  ||_| _||_| #
                             # fourth line is always blank

Is converted to "1234567890"
Step Four

Update your program to handle multiple numbers, one per line. When converting
several lines, join the lines with commas.

    _  _
  | _| _|
  ||_  _|

    _  _
|_||_ |_
  | _||_|

 _  _  _
  ||_||_|
  ||_| _|

Is converted to "123,456,789"

=end

class OCR
  ZERO = <<-NUMBER.chomp
 _
| |
|_|

NUMBER
  ONE = <<-NUMBER.chomp

  |
  |

NUMBER

  TWO = <<-NUMBER.chomp
 _
 _|
|_

NUMBER

  THREE = <<-NUMBER.chomp
 _
 _|
 _|

NUMBER

  FOUR =  <<-NUMBER.chomp

|_|
  |

NUMBER

  FIVE = <<-NUMBER.chomp
 _
|_
 _|

NUMBER

  SIX = <<-NUMBER.chomp
 _
|_
|_|

NUMBER

  SEVEN = <<-NUMBER.chomp
 _
  |
  |

NUMBER

  EIGHT = <<-NUMBER.chomp
 _
|_|
|_|

NUMBER

  NINE = <<-NUMBER.chomp
 _
|_|
 _|

NUMBER

  DIG_HASH = Hash.new('?').merge(
    { ZERO => "0", ONE => "1", TWO => "2", THREE => "3", FOUR => "4",
      FIVE => "5", SIX => "6", SEVEN => "7", EIGHT => "8", NINE => "9" }
  )

  def initialize(text)
    @text = text
  end

  def convert
    # split_digits
    split_digits.map { |arr| DIG_HASH.values_at(*arr).join }.join(',')
  end

  def count_digits
    @text.split("\n")[1].size.fdiv(3).ceil
  end

  def split_digits
    split_sections
    @sections.map do |sec|
      sec.split("\n").map { |s| s.ljust(3 * count_digits) }
         .map { |s| s.scan(/.../) }
         .transpose
         .map { |arr| arr.map { |s| s.rstrip + "\n" } }
         .map(&:join)
    end
  end

  def split_sections
    @sections = @text.split("\n\n")
    @sections[0..-2].map { |s| s + "\n" }
  end
end

# text = <<-NUMBER.chomp
#
#   |
#   |
#
# NUMBER
#
# text2 = <<-NUMBER.chomp
#     _
#   || |
#   ||_|
#
# NUMBER
#
#
# #
# p text
# p OCR.new(text).convert
# # p OCR.new(text).pts
# #
# # p OCR.new(text).count_digits
# # p OCR.new(text2).count_digits
# # p OCR.new(text2).split_digits
# # p OCR.new(text2).convert
#
# text3 = <<-NUMBER.chomp
#     _  _
#   | _| _|
#   ||_  _|
#
#     _  _
# |_||_ |_
#   | _||_|
#
#  _  _  _
#   ||_||_|
#   ||_| _|
#
# NUMBER
#
# p text3
# p OCR.new(text3).split_sections
# p OCR.new(text3).split_digits
# p OCR.new(text3).convert
