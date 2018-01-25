=begin

Beer Song

Write a program that can generate the lyrics of the 99 bottle bear song. See
the test suite for the entire song.

=end

class BeerSong
  def verse(n)
    "#{bottle_str(n).capitalize} on the wall, #{bottle_str(n)}.\n" \
    "#{remain_str(n)}, #{bottle_str((n - 1) % 100)} on the wall.\n"
  end

  def verses(n, m)
    n.downto(m).map { |k| verse(k) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  private

  def bottle_str(n)
    "#{n > 0 ? n : 'no more'} bottle#{n == 1 ? '' : 's'} of beer"
  end

  def remain_str(n)
    if n > 0
      "Take #{n == 1 ? 'it' : 'one'} down and pass it around"
    else
      "Go to the store and buy some more"
    end
  end
end
