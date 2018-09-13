# frozen_string_literal: true

require 'minitest/autorun'
require '../review/case02_review'

class Uc02Spec < Minitest::Spec
  describe Zaiko do
    it 'CSVファイルを集計して出力する' do
      output = <<~EOS
          商品名,受入数
          商品A,6
          商品B,6
          商品C,10
      EOS
      zaiko = Zaiko.new('20180701_INPUT.csv','20180701_OUTPUT.csv')
      zaiko.create_summary_file
      expected_csv = output
      actual_csv = File.open('20180701_OUTPUT.csv').read
      assert_equal(expected_csv, actual_csv)
    end
  end
end
