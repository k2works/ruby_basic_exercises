# frozen_string_literal: true

require 'minitest/autorun'
require '../review/case04_review'

class Uc04Spec < Minitest::Spec
  describe Zaiko do
    describe '#initialize' do
      it '作成配列確認' do
        shuke = Zaiko.new('20180701_INPUT.csv')
        expect( shuke.instance_variable_get(:@input)).must_equal [["商品名", "受入数"], ["商品A", "1"], ["商品A", "1"], ["商品A", "1"], ["商品A", "1"], ["商品A", "1"], ["商品A", "1"], ["商品B", "1"], ["商品B", "2"], ["商品B", "3"], ["商品C", "10"]]
        expect( shuke.instance_variable_get(:@output)).must_equal [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
      end
    end
    describe '#shukei' do
      it '集計する' do
        zaiko = Zaiko.new('20180701_INPUT.csv')
        zaiko.sutika
        zaiko.shukei
        expect( zaiko.instance_variable_get(:@output)).must_equal [["商品名", "受入数"], ["商品A", 6], ["商品B", 6], ["商品C", 10], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
      end
    end
    describe '#shukei_file_sakusei' do
      it 'CSVファイルを出力する' do
        zaiko = Zaiko.new('20180701_INPUT.csv')
        zaiko.shukei_file_sakusei
        output = <<~EOS
          商品名,受入数
          商品A,6
          商品B,6
          商品C,10
        EOS
        expected_csv = output
        actual_csv = File.open('20180701_OUTPUT.csv').read
        assert_equal(expected_csv, actual_csv)
      end
    end
  end
end
