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
  OPS = { 'plus' => '+', 'minus' => '-', 'multiplied by' => '*',
          'divided by' => '/', 'modulus' => '%', 'to power' => '**' }

  def initialize(question)
    @question = question.downcase
  end

  def answer
    check_valid_question
    nums_ar, ops_ar = nums_and_ops
    nums_ar.reduce { |sum, elm| sum.send(ops_ar.shift, elm) }
  end

  def nums_and_ops
    OPS.each_with_object(@question.dup[8..-2]) { |(k, v), obj| obj.gsub!(k, v) }
       .split.map.with_index { |elm, idx| idx.even? ? elm.to_i : elm.to_sym }
       .partition.with_index { |_, idx| idx.even? }
  end

  def check_valid_question
    num_reg = /\-?\d+/
    op_reg = Regexp.new "(#{OPS.keys.join('|')})"
    reg = /\Awhat is #{num_reg}( #{op_reg} #{num_reg})*\?\z/
    raise ArgumentError unless @question.match?(reg)
  end
end
