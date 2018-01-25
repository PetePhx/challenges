=begin

Consider a character set consisting of letters, a space, and a point. Words
consist of one or more, but at most 20 letters. An input text consists of one or
more words separated from each other by one or more spaces and terminated by 0
or more spaces followed by a point. Input should be read from, and including,
the first letter of the first word, up to and including the terminating point.
The  output text is to be produced such that successive words are separated by a
single space with the last word being terminated by a single point. Odd words
are copied in reverse order while even words are merely echoed. For example, the
input string

"whats the matter with kansas." becomes "whats eht matter htiw kansas."

BONUS POINT: the characters must be read and printed one at a time.

=end

=begin

- char set: letters, space, point
- words: 1 upto 20 letters
- word separation: 1 or more spaces
- INPUT: one/more words, terminated by 0/more spaces, terminated by point.
- Read input from the first letter of the first word.
- OUTPUT: words separated by a single space. Odd words reversed.
                                              even words same.

=end

# non-bonus version
# algo:
# => - strip the sentence from beginning white space(s), end point.
# => - squeeze the spaces
# => - split the sentence to words.
# => - map the words based on index: same (even) or reverse (odd)
# => - join the words with a space in between. add the point at the end.

def odd_words(str)
  words = str[0..-2].strip.squeeze(' ').split.map.with_index do |w, idx|
    idx.odd? ? w.reverse : w
  end.join(' ') + str[-1]
end

p odd_words("whats the matter  with kansas .")
p odd_words(" Forget about Kansas  whats the matter with YOU.")
# "whats eht matter htiw kansas."
# "Forget tuoba Kansas stahw the rettam with UOY."

# Bonus version
# algo:
#   - initialize empty array for one word.
#   - iterate through the string
#     - discard initial white spaces
#     - every character read, check if letter or space or point
#       - if letter, add to the one word array
#       - if space, then
#            if one-word array not empty:
#            if index even:
#              print one-word array elements,
#            if index odd:
#              print one-word array in reverse,
#            increment index:
#            print space if next char not space/point
#            empty the word array
#       - if point, print point, stop iteration.

require 'pry'

def odd_words(str)
  arr = []
  word_idx = 0
  str.each_char.with_index do |c, idx|
    case c.downcase
    when 'a'..'z'
      arr << c
    when ' '
      unless arr.empty?
        word_idx.odd? ? arr.reverse.each {|chr| print chr} : arr.each {|chr| print chr}
        word_idx += 1
        arr = []
      end
      print c unless [' ', '.'].include?(str[idx + 1]) || word_idx == 0
    when '.'
      unless arr.empty?
        word_idx.odd? ? arr.reverse.each {|chr| print chr} : arr.each {|chr| print chr}
      end
      print c
      return
    end
  end
end

p odd_words("whats the matter  with kansas .")
p odd_words(" Forget about Kansas  whats the matter with YOU.")

# whats eht matter htiw kansas.nil
# Forget tuoba Kansas stahw the rettam with UOY.nil
