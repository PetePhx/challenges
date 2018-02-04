=begin

Bowling

Write a program that can score a bowling game.

Bowling is game where players roll a heavy ball to knock down pins arranged in a
triangle. Write code to keep track of the score of a game of bowling.
Scoring Bowling

The game consists of 10 frames. A frame is composed of one or two ball throws
with 10 pins standing at frame initialization. There are three cases for the
tabulation of a frame.

    An open frame is where a score of less than 10 is recorded for the frame. In
    this case the score for the frame is the number of pins knocked down.

    A spare is where all ten pins are knocked down after the second throw. The
    total value of a spare is 10 plus the number of pins knocked down in their
    next throw.

    A strike is where all ten pins are knocked down after the first throw. The
    total value of a strike is 10 plus the number of pins knocked down in their
    next two throws. If a strike is immediately followed by a second strike,
    then we can not total the value of first strike until they throw the ball
    one more time.

Here is a three frame example:
Frame 1     Frame 2     Frame 3
X (strike)  5/ (spare)  9 0 (open frame)

Frame 1 is (10 + 5 + 5) = 20

Frame 2 is (5 + 5 + 9) = 19

Frame 3 is (9 + 0) = 9

This means the current running total is 48.

The tenth frame in the game is a special case. If someone throws a strike or a
spare then they get a fill ball. Fill balls exist to calculate the total of the
10th frame. Scoring a strike or spare on the fill ball does not give the player
more fill balls. The total value of the 10th frame is the total number of pins
knocked down.

For a tenth frame of X1/ (strike and a spare), the total value is 20.

For a tenth frame of X-X-X (three strikes), the total value is 30.
Requirements

Write code to keep track of the score of a game of bowling. It should support
two operations:

    roll(pins) is called each time the player rolls a ball. The argument is the
    number of pins knocked down.

    score() is called only at the very end of the game. It returns the total
    score for that game.

=end

class Game
  def initialize
    @frame = 1
    @states = Array.new(12) { [0, 0] }
    @first_throw = true
  end

  def roll(pins)
    verify_proceed(pins)
    idx = @frame - 1
    if pins == 10 && @first_throw
      @frame += 1
      @states[idx] = [10]
    elsif @first_throw
      @first_throw = false
      @states[idx] = [pins, 0]
    else
      @frame += 1
      @first_throw = true
      @states[idx] = [@states[idx].first, pins]
    end
    update_scores if game_ended?
  end

  def update_scores
    @scores = @states[0..9].map(&:sum)
    @states.each_cons(3).with_index do |(ar1, ar2, ar3), idx|
      @scores[idx] += (ar2 + ar3).first(2).sum if ar1 == [10]
    end
    @states[0..10].each_cons(2).with_index do |(ar1, ar2), idx|
      @scores[idx] += ar2.first if ar1.sum == 10 && ar1 != [10]
    end
  end

  def score
    raise 'Score cannot be taken until the end of the game' unless game_ended?
    @scores.reduce(0, :+)
  end

  def verify_proceed(pins)
    raise 'Pins must have a value from 0 to 10' unless (0..10).cover? pins
    raise 'Should not be able to roll after game is over' if game_ended?
    raise 'Pin count exceeds pins on the lane' unless @first_throw ||
      pins + @states[@frame - 1].first <= 10
  end

  def game_ended?
    @frame == 11 && (@states[9].sum < 10 ||
      @states[9].sum == 10 && @states[9] != [10] && !@first_throw) ||
      @frame == 12 && @states[9] == [10] && @states[10] != [10] ||
      @frame == 13
  end
end
