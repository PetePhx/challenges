=begin

Simple Linked List

Write a simple linked list implementation that uses Elements and a List.

The linked list is a fundamental data structure in computer science, often used
in the implementation of other data structures.

The simplest kind of linked list is a singly linked list. Each element in the
list contains data and a "next" field pointing to the next element in the list
of elements. This variant of linked lists is often used to represent sequences
or push-down stacks (also called a LIFO stack; Last In, First Out).

Lets create a singly linked list to contain the range (1..10), and provide
functions to reverse a linked list and convert to and from arrays.

=end

class Element
  attr_accessor :datum, :next
  def initialize(input, next_elm = nil)
    self.datum = input
    self.next = next_elm
  end

  def tail?
    self.next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :size, :head
  def initialize
    self.size = 0
  end

  def empty?
    size.zero?
  end

  def push(input)
    e = Element.new(input, head)
    self.head = e
    self.size += 1
  end

  def pop
    return nil if head.nil?
    self.size -= 1
    e = head
    self.head = head.next
    e.datum
  end

  def peek
    head && head.datum
  end

  def self.from_a(arr)
    sll = new
    arr.reverse.each { |e| sll.push e } unless arr.nil? || arr.empty?
    sll
  end

  def to_a
    e = Element.new("hi", head)
    size.times.with_object([]) { |_, arr| (e = e.next) && arr << e.datum }
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end
end
