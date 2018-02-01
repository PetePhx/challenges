=begin

Run-length Encoding

Implement run-length encoding and decoding.

Run-length encoding (RLE) is a simple form of data compression, where runs
(consecutive data elements) are replaced by just one data value and count.

For example we can represent the original 53 characters with only 13.

"WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"  ->  "12WB12W3B24WB"

RLE allows the original data to be perfectly reconstructed from the compressed
data, which makes it a lossless data compression.

"AABCCCDEEEE"  ->  "2AB3CD4E"  ->  "AABCCCDEEEE"

=end

class RunLengthEncoding
  def self.encode(str)
    str.gsub(/(.)\1+/) { |substr| substr.length.to_s + substr[0] }
  end

  def self.decode(str)
    str.scan(/\d*./).map { |c| c.size > 1 ? (c[-1] * c[0..-2].to_i) : c }.join
  end
end
