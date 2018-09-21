# frozen_string_literal: true

require 'minitest/autorun'
require '../review/case01_review'

class Uc01Spec < Minitest::Spec
  describe Zaiko do
    before do
      INPUT_FILE = '20180701_INPUT.csv'
      OUTPUT_FILE = '20180701_OUTPUT.csv'
      File.delete(OUTPUT_FILE) if File.exist?(OUTPUT_FILE)
    end

    describe '#summary_file_output' do
      it '集計した在庫ファイルを出力する' do
        zaiko = Zaiko.new(INPUT_FILE)
        zaiko.summary_file_output
        output = <<~EOS
          商品名,受入数
          商品A,6
          商品B,6
          商品C,10
        EOS
        expected_csv = output
        actual_csv = File.open(OUTPUT_FILE).read
        assert_equal(expected_csv, actual_csv)
      end
    end
  end
end
