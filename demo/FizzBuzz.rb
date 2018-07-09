# frozen_string_literal: true
class FizzBuzz
end

require 'minitest/autorun'
class FizzBuzzSpec < Minitest::Spec
  describe FizzBuzz do
    it '3ならばFizzを返す' do
      expect(3).must_equal 'Fizz'
    end
  end
end
