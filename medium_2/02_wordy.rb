=begin

Wordy

Write a program that takes a word problem and returns the answer as an integer.

E.g.

    What is 5 plus 13?

The program should return 18.

    What is 7 minus 5 minus 1?

The program should return 1.

Remember, that these are verbal word problems, not treated as you normally would
treat a written problem. This means that you calculate as you move forward each
step. This means 3 + 2 * 3 = 15, not 9.

Hint: to solve this problem elegantly, you need to know how the send method
works in Ruby. If you haven't seen it before, check it out here.

http://stackoverflow.com/questions/3337285/what-does-send-do-in-ruby

=end

class WordProblem
  OPS = {'plus' => '+', 'minus' => '-', 'multiplied by' => '*',
    'divided by' => '/', 'modulus' => '%', 'to power' => '**'}

  def initialize(question)
    @question = question.downcase
  end

  def answer
    nums_ar, ops_ar = nums_and_ops
    nums_ar.reduce { |sum, elm| sum.send(ops_ar.shift, elm) }
  end

  def nums_and_ops
    raise ArgumentError unless @question.match?(/^what is (.*)\?$/)
    str = @question.match(/^what is (.*)\?$/)[1]
    OPS.each { |k,v| str.gsub!(k, v) }
    nums_ar, ops_ar = str.split.partition.with_index { |elm, idx| idx.even? }
    nums_ar.map! { |e| raise ArgumentError unless e.to_i.to_s == e; e.to_i }
    ops_ar.map! { |e| raise ArgumentError unless OPS.values.index(e); e.to_sym }
    [nums_ar, ops_ar]
  end
end

# p WordProblem.new('what is 3 plus 1 divided by 2 to power 2?').answer
