=begin

Rail Fence Cipher

Implement encoding and decoding for the rail fence cipher.

The Rail Fence cipher is a form of transposition cipher that gets its name from
the way in which it's encoded. It was already used by the ancient Greeks.

In the Rail Fence cipher, the message is written downwards on successive "rails"
of an imaginary fence, then moving up when we get to the bottom (like a
zig-zag). Finally the message is then read off in rows.

For example, using three "rails" and the message "WE ARE DISCOVERED FLEE AT
ONCE", the cipherer writes out:

W . . . E . . . C . . . R . . . L . . . T . . . E
. E . R . D . S . O . E . E . F . E . A . O . C .
. . A . . . I . . . V . . . D . . . E . . . N . .

Then reads off:

WECRLTEERDSOEEFEAOCAIVDEN

To decrypt a message you take the zig-zag shape and fill the ciphertext along
the rows.

? . . . ? . . . ? . . . ? . . . ? . . . ? . . . ?
. ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? .
. . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .

The first row has seven spots that can be filled with "WECRLTE".

W . . . E . . . C . . . R . . . L . . . T . . . E
. ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? .
. . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .

Now the 2nd row takes "ERDSOEEFEAOC".

W . . . E . . . C . . . R . . . L . . . T . . . E
. E . R . D . S . O . E . E . F . E . A . O . C .
. . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .

Leaving "AIVDEN" for the last row.

W . . . E . . . C . . . R . . . L . . . T . . . E
. E . R . D . S . O . E . E . F . E . A . O . C .
. . A . . . I . . . V . . . D . . . E . . . N . .

If you now read along the zig-zag shape you can read the original message.

=end

class RailFenceCipher
  def self.encode(str, n)
    return str if n == 1
    p idx_arr = build_idx_arr(str.size, n)
    str.chars.values_at(*idx_arr).join
  end

  def self.decode(str, n)
    return str if n == 1
    idx_arr = build_idx_arr(str.size, n)
    (0...str.size).each_with_object([]) do |idx, out|
      out[idx_arr[idx]] = str[idx]
    end.join
  end

  def self.build_idx_arr(str_size, n)
    rail_idx = 0.upto(n - 1).to_a + (n - 2).downto(1).to_a
    str_idx = 0...str_size
    str_idx.map { |i| rail_idx[i % (2 * n - 2)] }
           .zip(str_idx)
           .sort
           .map(&:last)
  end
end
