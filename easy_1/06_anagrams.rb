=begin

Anagrams

Write a program that, given a word and a list of possible anagrams, selects the
correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists"
"google" "inlets" "banana" the program should return a list containing "inlets".
Please read the test suite for exact rules of anagrams.

=end

# anagrams can have differng number of blank spaces,

class Anagram
  def initialize(str)
    @word = (str.is_a?(String) ? str : '')
    @let_freq = letter_frequencies(@word)
  end

  def match(str_arr)
    str_arr.each_with_object([]) do |word, out|
      out << word if letter_frequencies(word) == @let_freq &&
        word.downcase != @word.downcase
    end
  end

  private

    def letter_frequencies(str)
      characters = str.downcase.delete(' ').chars
      characters.each_with_object(Hash.new(0)) { |c, hsh| hsh[c] += 1 }
    end
end

# p Anagram.new("hello").match(%w[hello elloh hi hey okie dokie])
# ["elloh"]
