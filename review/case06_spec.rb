# frozen_string_literal: true

require 'minitest/autorun'
require '../review/case06'

class Uc06Spec < Minitest::Spec
  class Uc06Spec < Minitest::Spec
    describe Case06 do
      before do
        OUTPUT_FILE = '20180701_OUTPUT.csv'
        File.delete(OUTPUT_FILE) if File.exist?(OUTPUT_FILE)
      end

      it 'CSVファイルを出力する' do
        output = <<~EOS
          商品名,受入数
          商品A,6
          商品B,6
          商品C,10
        EOS
        Case06.execute
        expected_csv = output
        actual_csv = File.open('20180701_OUTPUT.csv').read
        assert_equal(expected_csv, actual_csv)
      end
    end
  end
end
