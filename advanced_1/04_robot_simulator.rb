=begin

Robot Simulator

A robot factory's test facility needs a program to verify robot movements.

The robots have three possible movements:

    turn right
    turn left
    advance

Robots are placed on a hypothetical infinite grid, facing a particular direction
(north, east, south, or west) at a set of {x,y} coordinates, e.g., {3,8}, with
coordinates increasing to the north and east.

The robot then receives a number of instructions, at which point the testing
facility verifies the robot's new position, and in which direction it is
pointing.

    The letter-string "RAALAL" means:
        Turn right
        Advance twice
        Turn left
        Advance once
        Turn left yet again

Say a robot starts at {7, 3} facing north. Then running this stream of
instructions should leave it at {9, 4} facing west.

=end

class Robot
  DIRS = { 0 => :east, 1 => :north, 2 => :west, 3 => :south } #trigonometric
  DIR_ERR_MSG = "Possible directions are :east, :north, :west and :south."
  POS_ERR_MSG = "Coordinates x and y should be integers."
  def initialize
    @position = [0, 0]
    @direction = 0
  end

  def orient(direction)
    raise ArgumentError, DIR_ERR_MSG unless DIRS.values.include?(direction)
    @direction = DIRS.key(direction)
  end

  def bearing
    DIRS[@direction]
  end

  def turn_right
    @direction = (@direction - 1) % 4
  end

  def turn_left
    @direction = (@direction + 1) % 4
  end

  def at(x, y)
    raise ArgumentError, POS_ERR_MSG unless [x, y].all? { |w| w.is_a? Integer }
    @position = [x, y]
  end

  def coordinates
    @position
  end

  def advance
    @position[@direction.even? ? 0 : 1] += @direction < 2 ? 1 : -1
  end
end

class Simulator
  INSTRUCTIONS = { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }
  INST_ERR_MSG = "Instructions string characters can only be 'A', 'L', or 'R'."

  def instructions(str)
    raise ArgumentError unless str =~ /[LRA]*/
    INSTRUCTIONS.values_at(*str.chars)
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, str)
    instructions(str).each { |sym| robot.send(sym) }
  end
end
