=begin

Grade School

Write a small archiving program that stores students' names along with the grade
that they are in.

In the end, you should be able to:

    Add a student's name to the roster for a grade
        "Add Jim to grade 2."
        "OK."
    Get a list of all students enrolled in a grade
        "Which students are in grade 2?"
        "We've only got Jim just now."
    Get a sorted list of all students in all grades. Grades should sort as 1, 2,
    3, etc., and students within a grade should be sorted alphabetically by name.
        "Who all is enrolled in school right now?"
        "Grade 1: Anna, Barb, and Charlie. Grade 2: Alex, Peter, and Zoe. Grade
        3…"

Note that all our students only have one name. (It's a small town, what do you
want?)

=end

class School
  class GradeError < StandardError; end

  def initialize
    @school = {}
  end

  def add(name, grd)
    check_valid_grade(grd)
    @school.key?(grd) ? @school[grd] << name : @school[grd] = [name]
    sort
  end

  def to_h
    @school
  end

  def grade(grd)
    check_valid_grade(grd)
    @school.key?(grd) ? @school[grd] : []
  end

  private

  def check_valid_grade(grd)
    raise GradeError.new("Nonexistent Grade #{grd}!") unless (1..12) === grd
  end

  def sort
    @school = @school.sort.map { |grd, arr| [grd, arr.map(&:capitalize).sort]  }
      .to_h
  end
end
