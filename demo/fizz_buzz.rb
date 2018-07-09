# frozen_string_literal: true
#
# ==FizzBuzzクラス
#
# Author:: k2works
# Version:: 0.0.1
# License:: Ruby License
#
class FizzBuzz
  def generate(number)
    if number % 3 == 0 and number % 5 == 0
      'FizzBuzz'
    elsif number % 3 == 0
      'Fizz'
    elsif number % 5 == 0
      'Buzz'
    end
  end

  def counter(count)
    count.times do |num|
      num += 1
      print generate(num)
    end
  end
end
