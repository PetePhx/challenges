=begin

Secret Handshake

Write a program that will take a decimal number, and convert it to the
appropriate sequence of events for a secret handshake.

There are 10 types of people in the world: Those who understand binary, and
those who don't. You and your fellow cohort of those in the "know" when it comes
to binary decide to come up with a secret "handshake".

1 = wink
10 = double blink
100 = close your eyes
1000 = jump


10000 = Reverse the order of the operations in the secret handshake.

handshake = SecretHandshake.new 9
handshake.commands # => ["wink","jump"]

handshake = SecretHandshake.new "11001"
handshake.commands # => ["jump","wink"]

The program should consider strings specifying an invalid binary as the value 0.

=end

class SecretHandshake
  ACTIONS = ["wink", "double blink", "close your eyes", "jump"]

  def initialize(n)
    @number = case n
              when Integer then n
              when String then n.to_i(2)
              end
  end

  def commands
    return [] unless (1..31).cover? @number
    arr = @number.to_s(2).chars.reverse.zip(ACTIONS)
    .select { |pair| pair[0] == '1' }.transpose[1].compact
    @number < 16 ? arr : arr.reverse
  end
end

# p SecretHandshake.new('1000').commands
p SecretHandshake.new('11001').commands
