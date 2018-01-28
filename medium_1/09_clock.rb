=begin

Clock

Create a clock that is independent of date.

You should be able to add and subtract minutes to it. Two clocks that represent
the same time should be equal to each other.

=end

class Clock
  MINUTES_IN_A_DAY = 60 * 24

  def initialize(hour, minute)
    @total_minutes = (hour * 60 + minute) % MINUTES_IN_A_DAY
  end

  def self.at(hour = 0, minute = 0)
    Clock.new(hour, minute)
  end

  def to_s
    format("%02d:%02d", *@total_minutes.divmod(60))
  end

  def +(minutes)
    hour, minute = ((@total_minutes + minutes) % MINUTES_IN_A_DAY).divmod(60)
    Clock.new(hour, minute)
  end

  def -(minutes)
    self.+(-minutes)
  end

  def ==(other)
    other.is_a?(Clock) &&
      @total_minutes == other.instance_variable_get(:@total_minutes)
  end
end
