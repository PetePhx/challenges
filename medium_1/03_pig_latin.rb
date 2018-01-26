=begin

Pig Latin

Pig Latin is a made-up children's language that's intended to be confusing. It
obeys a few simple rules (below), but when it's spoken quickly it's really
difficult for non-children (and non-native speakers) to understand.

  Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of
          the word.
  Rule 2: If a word begins with a consonant sound, move it to the end of the
          word, and then add an "ay" sound to the end of the word.

There are a few more rules for edge cases, and there are regional variants too.

=end

# no regexp:

class PigLatin
  VOWELS = %w[a e i o u]
  SPECIALS = %w[q x y]
  CONSONANTS = ('a'..'z').to_a - VOWELS - SPECIALS

  def initialize(str)
    @string = str
  end

  def self.translate(str)
    PigLatin.new(str).translate
  end

  def translate
    @string.split(' ').map do |word|
      str1, str2 = rotate_consonant(word)
      "#{str1}#{str2}ay"
    end.join(' ')
  end

  def rotate_consonant(word)
    arr1, arr2 = word.downcase.chars, []
    case arr1[0]
    when *CONSONANTS
      vowel_idx = arr1.find_index { |chr| VOWELS.include? chr }
      vowel_idx.times { arr2 << arr1.shift }
      arr2 << arr1.shift if arr2.last == 'q' && arr1.first == 'u'
    when 'q'
      (arr1[1] == 'u' ? 2 : 1).times { arr2 << arr1.shift }
    when 'x', 'y'
      (VOWELS.include?(arr1[1]) ? 1 : 0).times { arr2 << arr1.shift }
    end
    return [arr1.join, arr2.join]
  end
end
