# frozen_string_literal: true

require 'minitest/autorun'
require '../review/case05'

class Uc05Spec < Minitest::Spec
  describe Stock do
    describe '仕入れ商品を入荷する' do
      it 'CSVファイルを出力する' do
        output = <<~EOS
          商品名,受入数
          商品A,6
          商品B,6
          商品C,10
        EOS
        data = CsvStockData.new('20180701_INPUT.csv','20180731_OUTPUT.csv')
        stock = Stock.new(data)
        stock.goods_received
        expected_csv = output
        actual_csv = File.open('20180731_OUTPUT.csv').read
        assert_equal(expected_csv, actual_csv)
      end
    end
  end
end
