=begin

A computationally more efficient version of 10_nth_prime.rb

=end

class Prime
  def self.nth(n)
    raise ArgumentError unless n.is_a?(Integer) && n > 0
    pr_arr = [2]
    k = 3
    while pr_arr.size < n do
      (pr_arr << k) if (pr_arr.each do |pr|
          break false if (k % pr).zero?
          break true if pr * pr > k
        end)
      k += 2
    end
    pr_arr.last
  end
end
