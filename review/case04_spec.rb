# frozen_string_literal: true

require 'minitest/autorun'
require '../review/case04_review'

class Uc04Spec < Minitest::Spec
  describe Shuke do
    describe '#sutika' do
      it '数値化する' do
        shuke = Shuke.new('20180701_INPUT.csv')
        shuke.sutika
        expect( shuke.instance_variable_get(:@input)).must_equal [["商品名", "受入数"], ["商品A", 1], ["商品A", 1], ["商品A", 1], ["商品A", 1], ["商品A", 1], ["商品A", 1], ["商品B", 1], ["商品B", 2], ["商品B", 3], ["商品C", 10]]
      end
    end
    describe '#shukei' do
      it '集計する' do
        shuke = Shuke.new('20180701_INPUT.csv')
        shuke.sutika
        shuke.shukei
        expect( shuke.instance_variable_get(:@output)).must_equal [["商品名", "受入数"], ["商品A", 6], ["商品B", 6], ["商品C", 10], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
      end
    end
    describe '#outpt' do
      it 'CSVファイルを出力する' do
        shuke = Shuke.new('20180701_INPUT.csv')
        shuke.sutika
        shuke.shukei
        shuke.outp('20180701_OUTPUT.csv')
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
