# frozen_string_literal: true
class FizzBuzz
  def generate(number)
    'Fizz'
  end
end

require 'minitest/autorun'
class FizzBuzzSpec < Minitest::Spec
  describe FizzBuzz do
    describe '#generate' do
      it '3ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(3)).must_equal 'Fizz'
      end
    end
  end
end
