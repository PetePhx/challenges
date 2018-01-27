=begin

Phone Number

Write a program that cleans up user-entered phone numbers so that they can be
sent as SMS messages.

The rules are as follows:

    If the phone number is less than 10 digits assume that it is bad number
    If the phone number is 10 digits assume that it is good
    If the phone number is 11 digits and the first number is 1, trim the 1 and
      use the last 10 digits
    If the phone number is 11 digits and the first number is not 1, then it is a
      bad number
    If the phone number is more than 11 digits assume that it is a bad number

=end

class PhoneNumber
  BAD_NUMBER = '0' * 10

  def initialize(str)
    @numstr = str.gsub(/[ \.\(\)\-]/, '')
  end

  def number
    return BAD_NUMBER if @numstr.match(/[^\d]/)
    return case @numstr.length
           when 10 then @numstr
           when 11 then (@numstr[0] == '1' ? @numstr[1..-1] : BAD_NUMBER)
           else BAD_NUMBER
           end
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end
end
