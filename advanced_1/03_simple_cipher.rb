=begin

Simple Cipher

Implement a simple shift cipher like Caesar and a more secure substitution
cipher.

Step 1:

    "If he had anything confidential to say, he wrote it in cipher, that is, by
    so changing the order of the letters of the alphabet, that not a word could
    be made out. If anyone wishes to decipher these, and get at their meaning,
    he must substitute the fourth letter of the alphabet, namely D, for A, and
    so with the others."

-- Suetonius, Life of Julius Caesar

Ciphers are very straight-forward algorithms that allow us to render text less
readable while still allowing easy deciphering. They are vulnerable to many
forms of cryptoanalysis, but we are lucky that generally our little sisters are
not cryptoanalysts.

The Caeser Cipher was used for some messages from Julius Caesar that were sent
afield. Now Caeser knew that the cipher wasn't very good, but he had one ally in
that respect: almost nobody could read well. So even being a couple letters off
was sufficient so that people couldn't recognize the few words that they did
know.

Your task is to create a simple shift cipher like the Caesar Cipher. This image
is a great example of the Caesar Cipher:

Caesar Cipher

Here are some examples:

@cipher = Cipher.new
@cipher.encode("iamapandabear") #=> "ldpdsdqgdehdu"
@cipher.decode("ldpdsdqgdehdu") #=> "iamapandabear"

Step 2:

Shift ciphers are no fun though when your kid sister figures it out. Try
amending the code to allow us to specify a key and use that for the shift
distance. This is called a substitution cipher.

Here's an example:

@cipher = Cipher.new("aaaaaaaaaaaaaaaaaa")
@cipher.encode("iamapandabear") #=> "iamapandabear"
@cipher = Cipher.new("ddddddddddddddddd")
@cipher.encode("imapandabear") #=> "lpdsdqgdehdu"

In the example above, we've set a = 0 for the key value. So when the plaintext
is added to the key, we end up with the same message coming out. So "aaaa" is
not an ideal key. But if we set the key to "dddd", we would get the same thing
as the Caesar Cipher.

Step 3:

The weakest link in any cipher is the human being. Let's make your substitution
cipher a little more fault tolerant by providing a source of randomness and
ensuring that they key is not composed of numbers or capital letters.

If someone doesn't submit a key at all, generate a truly random key of at least
100 characters in length, accessible via Cipher#key (the # syntax means instance
variable)

If the key submitted has capital letters or numbers, throw an ArgumentError with
a message to that effect.

Some examples:

@cipher = Cipher.new
@cipher.key #=> "duxrceqyaimciuucnelkeoxjhdyduucpmrxmaivacmybmsdrzwqxvbxsygzsabd
jmdjabeorttiwinfrpmpogvabiofqexnohrqu"

=end

class Cipher
  ARG_ERR_MSG = 'Encryption key can only be a string of lowercase letters!'
  CHAR_ARR = ('a'..'z').to_a
  DEF_KEY_LEN = 100
  A_ORD = CHAR_ARR[0].ord
  attr_accessor :key

  def initialize(k = generate_key)
    raise ArgumentError, ARG_ERR_MSG unless k =~ /\A[a-z]+\z/
    self.key = k
  end

  def generate_key
    DEF_KEY_LEN.times.with_object([]) {|_, ob| ob << CHAR_ARR.sample }.join
  end

  def encode(plaintext)
    plaintext.downcase.each_char.with_index.map do |ch, idx|
      ((ch.ord + key[idx % key.length].ord - 2 * A_ORD) % 26 + A_ORD).chr
    end.join
  end

  def decode(ciphertext)
    ciphertext.downcase.each_char.with_index.map do |ch, idx|
      ((ch.ord - key[idx % key.length].ord) % 26 + A_ORD).chr
    end.join
  end
end
