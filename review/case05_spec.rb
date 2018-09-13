# frozen_string_literal: true

require 'minitest/autorun'
require '../review/case05'

class Uc05Spec < Minitest::Spec
  describe Stock do
    it '仕入れ商品を入荷する' do
      stock = Stock.new('20180701_INPUT.csv')
      output = <<~EOS
        商品名,受入数
        商品A,6
        商品B,6
        商品C,10
      EOS
      expected_csv = output
      actual_csv = File.open('20180731_OUTPUT.csv').read
      assert_equal(expected_csv, actual_csv)
    end
  end
end
