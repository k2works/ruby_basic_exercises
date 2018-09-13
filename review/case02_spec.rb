# frozen_string_literal: true

require 'minitest/autorun'
require '../review/case02_review'

class Uc02Spec < Minitest::Spec
  describe Zaiko do
    it 'CSVファイルを出力する' do
      output = <<~EOS
          商品名,受入数
          商品A,6
          商品B,6
          商品C,10
      EOS
      Zaiko.execute
      expected_csv = output
      actual_csv = File.open('20180701_OUTPUT.csv').read
      assert_equal(expected_csv, actual_csv)
    end
  end
end
