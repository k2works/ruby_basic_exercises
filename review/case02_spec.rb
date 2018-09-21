# frozen_string_literal: true

require 'minitest/autorun'
require '../review/case02_review'

class Uc02Spec < Minitest::Spec
  describe Zaiko do
    before do
      INPUT_FILE = '20180701_INPUT.csv'
      OUTPUT_FILE = '20180701_OUTPUT.csv'
      File.delete(OUTPUT_FILE) if File.exist?(OUTPUT_FILE)
    end

    it 'CSVファイルを集計して出力する' do
      output = <<~EOS
          商品名,受入数
          商品A,6
          商品B,6
          商品C,10
      EOS
      zaiko = Zaiko.new(INPUT_FILE,OUTPUT_FILE)
      zaiko.create_summary_file
      expected_csv = output
      actual_csv = File.open(OUTPUT_FILE).read
      assert_equal(expected_csv, actual_csv)
    end
  end
end
