=begin

Meetup

Typically meetups happen on the same day of the week.

Examples are

    the first Monday
    the third Tuesday
    the Wednesteenth
    the last Thursday

Note that "Monteenth", "Tuesteenth", etc are all made up words. There was a
meetup whose members realised that there are exactly 7 days that end in
'-teenth'. Therefore, one is guaranteed that each day of the week (Monday,
Tuesday, ...) will have exactly one date that is named with '-teenth' in every
month.

Write code that calculates date of meetups.

=end
require 'date'

class Meetup
  def initialize(m, y)
    @month = m
    @year = y
  end

  def day(weekday, position)
    days_arr = (1..31).map { |d| Time.new(@year, @month, d) }
      .select { |time| time.mon == @month }
      .select { |time| Date::DAYNAMES[time.wday].downcase.to_sym == weekday }
      .map(&:mday)
    Date.new(@year, @month, day_in_month(days_arr, position))
  end

  private

  def day_in_month(days_arr, position)
    case position
    when :first then days_arr.first
    when :last then days_arr.last
    when :second then days_arr[1]
    when :third then days_arr[2]
    when :fourth then days_arr[3]
    when :teenth then days_arr.select {|elm| (13..19) === elm }.first
    end
  end
end
