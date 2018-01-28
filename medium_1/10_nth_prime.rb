=begin

Nth Prime

Write a program that can tell you what the nth prime is.

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
the 6th prime is 13.

Do not use Ruby's Prime class nor any of the prime-number testing methods in the
Integer class. For an algorithm to determine whether a number is prime, check
out this article:

http://www.counton.org/explorer/primes/checking-if-a-number-is-prime/

=end

=begin
  - input: positive integer (n)
  - output: positive integer: n'th prime number
  - algo:
    - set the primes array pr_arr to empty []
    - set the prime index pr_idx to zero
    - iterate over positive integers starting from 2: k
      - find the sqrt(k). floor it
      - seletc pr_arr elements less-than-equal-to sqrt(k).floor
      - k divisible to any of these?
        - yes: k is not prime
        - no: k is prime: add k to the pr_arr. increase pr_idx
          - if pr_idx == n, then break
    - return pr_arr.last
=end

class Prime
  def self.nth(n)
    raise ArgumentError unless n.is_a?(Integer) && n > 0
    pr_arr = []
    k = 2
    while pr_arr.size < n do
      pr_arr << k if pr_arr.select { |pr| pr <= Math::sqrt(k) }
        .none? { |pr| k % pr == 0 }
      k += 1
    end
    pr_arr.last
  end
end

# p Prime.nth(10)
