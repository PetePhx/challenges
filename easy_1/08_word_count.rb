=begin

Word Count

Write a program that given a phrase can count the occurrences of each word in
that phrase.

For example, if we count the words for the input "olly olly in come free", we
should get:

olly: 2
in: 1
come: 1
free: 1

=end

class Phrase
  def initialize(str)
    @string = str.downcase
      .gsub(',', ', ')
      .gsub(/[^a-z0-9\s\n']/i, '')
      .gsub(/(^'| '|' |'$|\n)/, ' ')
      .squeeze(' ')
      .strip
  end

  def word_count
    @string.split(/\s/).each_with_object(Hash.new(0)) { |w, hsh| hsh[w] += 1 }
  end
end

# p Phrase.new("'car : carpet as java : javascript!!&@$%^&'").word_count
# p Phrase.new("one,\ntwo,\nthree").word_count
# p Phrase.new("First: don't laugh. Then: don't cry.").word_count
