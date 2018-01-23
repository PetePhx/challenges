=begin

Sieve of Eratosthenes

Write a program that uses the Sieve of Eratosthenes to find all the primes from
2 up to a given number.

The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime
numbers up to any given limit. It does so by iteratively marking as composite
(i.e. not prime) the multiples of each prime, starting with the multiples of 2.

Create your range, starting at two and continuing up to and including the given
limit. (i.e. [2, limit]).

The algorithm consists of repeating the following over and over:

    take the next available unmarked number in your list (it is prime)
    mark all the multiples of that number (they are not prime)

Repeat until you have processed each number in your range. When the algorithm
terminates, all the numbers in the list that have not been marked are prime. The
wikipedia article has a useful graphic that explains the algorithm.

Notice that this is a very specific algorithm, and the tests don't check that
you've implemented the algorithm, only that you've come up with the correct list
of primes.

=end

=begin
  - input: class Sieve, initialize with integer n
  - output: method #primes returns an array of primes upto n
  - algo:
    - sieve of eratosthenes
    - create a range [2, n]
    - iterate though each array element
      - remove all proper multiples of that number from the array
    - return the array of the remaining elements (primes)

    In each iteration, we have the indices for non-prime numbers:

     on_prime_idx = 2.upto(@n / arr[idx]).to_a.map { |i| i * arr[idx] }
=end

class Sieve
  def initialize(limit)
    @n = limit
  end

  def primes
    arr = (0..@n).to_a
    2.upto(arr.size / 2) do |idx|
      next if arr[idx].nil?
      2.upto(@n / arr[idx]).map {|i| i * arr[idx]}.each {|jdx| arr[jdx] = nil}
    end
    arr.drop(2).compact
  end
end
