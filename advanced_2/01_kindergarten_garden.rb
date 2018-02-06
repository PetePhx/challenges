=begin

Kindergarten Garden

The kindergarten class is learning about growing plants. The teachers thought it
would be a good idea to give them actual seeds, plant them in actual dirt, and
grow actual plants.

They've chosen to grow grass, clover, radishes, and violets.

To this end, they've put little styrofoam cups along the window sills, and
planted one type of plant in each cup, choosing randomly from the available
types of seeds.

[window][window][window]
........................ # each dot represents a styrofoam cup
........................

There are 12 children in the class:

    Alice, Bob, Charlie, David,
    Eve, Fred, Ginny, Harriet,
    Ileana, Joseph, Kincaid, and Larry.

Each child gets 4 cups, two on each row. The children are assigned to cups in
alphabetical order.

The following diagram represents Alice's plants:

[window][window][window]
VR......................
RG......................

So in the row nearest the window, she has a violet and a radish; in the row
behind that, she has a radish and some grass.

Your program will be given the plants from left-to-right starting with the row
nearest the windows. From this, it should be able to determine which plants
belong to which students.

For example, if it's told that the garden looks like so:

[window][window][window]
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV

Then if asked for Alice's plants, it should provide:

    Violets, radishes, violets, radishes

While asking for Bob's plants would yield:

    Clover, grass, clover, clover

=end

class Garden
  FLOWERS = { 'C' => :clover, 'G' => :grass, 'R' => :radishes, 'V' => :violets }
  STUDENTS = %w[Alice Bob Charlie David Eve Fred Ginny Harriet Ileana
                Joseph Kincaid Larry]

  def initialize(diagram, students = STUDENTS)
    @row1, @row2 = diagram.split("\n")
    @students = students.map(&:downcase).sort
    @students.each do |stu|
      define_singleton_method(stu) do
        idx = @students.index(stu)
        arr = @row1[idx * 2, 2].split('') + @row2[idx * 2, 2].split('')
        FLOWERS.values_at(*arr)
      end
    end
  end
end
