=begin

Crypto Square

Implement the classic method for composing secret messages called a square code.

The input is first normalized: The spaces and punctuation are removed from the
English text and the message is down-cased.

Then, the normalized characters are broken into rows. These rows can be regarded
as forming a rectangle when printed with intervening newlines.

For example, the sentence

    If man was meant to stay on the ground god would have given us roots

is 54 characters long.

Broken into 8-character columns, it yields 7 rows.

Those 7 rows produce this rectangle when printed one per line:

ifmanwas
meanttos
tayonthe
groundgo
dwouldha
vegivenu
sroots

The coded message is obtained by reading down the columns going left to right.
For example, the message above is coded as:

imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau

Write a program that, given an English text, outputs the encoded version of that
text.

The size of the square (number of columns) should be decided by the length of
the message. If the message is a length that creates a perfect square (e.g. 4,
9, 16, 25, 36, etc), use that number of columns. If the message doesn't fit
neatly into a square, choose the number of columns that corresponds to the
smallest square that is larger than the number of characters in the message.

=end

=begin

-class: Crypto
- initialize: with the plaintext string
- imethod: normalize_plaintext
  - gets rid of all non-alpha-numeric chars.
  - downcase

- imethod: size
  - select the square size
  - smallest n s.t. n**2 >= string.size

- imethod: plaintext_segments
  - chop the processed string to "size" segments, join with ' '

- imethod: ciphertext
  - build the ciphertext.
  - algo:
    - normalize the string, get the size (n),
    - fill the n x n matrix with the normalized plain text
    - fill the remaining element with ' '
    - transpose the matrix
    - join the rows as words, join the words with ' '
    - get rid of the empth space at the end (strip)

=end

class Crypto
  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    @norm_text = @text.downcase.gsub(/[^a-z0-9]/, '')
  end

  def size
    @size = Math::sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    @plain_segs = normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext
    padded = normalize_plaintext + ' ' * (size**2 - normalize_plaintext.size)
    @matrix = padded.scan(/.{1,#{@size}}/).map { |str| str.split('') }
    @matrix.transpose.map(&:join).map(&:strip).join
  end

  def normalize_ciphertext
    ciphertext unless @matrix
    @norm_cipher = @matrix.transpose.map(&:join).map(&:strip).join(' ')
  end
end
