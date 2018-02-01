=begin

Robot Name

Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name.The first time you
boot them up, a random name is generated, such as RX837 or BC811.

Every once in a while we need to reset a robot to its factory settings, which
means that their name gets wiped. The next time you ask, it will respond with a
new random name.

The names must be random: they should not follow a predictable sequence. Random
names means a risk of collisions. Your solution should not allow the use of the
same name twice when avoidable.

=end

class Robot
  attr_accessor :name
  @@names = []
  def initialize
    reset
  end

  def reset
    @@names.delete(name)
    while @@names.include?(self.name = sample_name); end
    @@names << name
  end

  def sample_name
    ('AA'..'ZZ').to_a.sample + ('000'..'999').to_a.sample
  end
end
