# frozen_string_literal: true

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

require 'minitest/autorun'
class FizzBuzzSpec < Minitest::Spec
  describe FizzBuzz do
    describe '#generate' do
      it '3ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(3)).must_equal 'Fizz'
      end

      it '6ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(6)).must_equal 'Fizz'
      end

      it '5ならばBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(5)).must_equal 'Buzz'
      end

      it '10ならばBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(10)).must_equal 'Buzz'
      end

      it '50ならばBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(50)).must_equal 'Buzz'
      end

      it '15ならばFizzBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(15)).must_equal 'FizzBuzz'
      end

      it '30ならばFizzBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(30)).must_equal 'FizzBuzz'
      end
    end

    describe '#counter' do
      it '15ならばFizz Buzz Fizz Fizz Buzz Fizz FizzBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        output = 'FizzBuzzFizzFizzBuzzFizzFizzBuzz'
        proc {fizz_buzz.counter(15)}.must_output output
      end
    end
  end
end
