# frozen_string_literal: true

require 'minitest/autorun'
require '../review/case01_review'

class Uc01Spec < Minitest::Spec
  describe Zaiko do
    describe '#intconversion' do
      it '配列に変換する' do
        zaiko = Zaiko.new
        expect(zaiko.intconversion).must_equal ['商品名,受入数', '商品A,1', '商品A,1', '商品A,1', '商品A,1', '商品A,1', '商品A,1', '商品B,1', '商品B,2', '商品B,3', '商品C,10']
      end
    end
    describe '#add' do
      it '配列を集計する' do
        zaiko = Zaiko.new
        zaiko.intconversion
        zaiko.add
        expect(zaiko.instance_variable_get(:@check)).must_equal ['商品名', 0, '商品A', 6, '商品B', 6, '商品C', 10]
      end
    end
    describe '#add_headfer' do
      it 'ヘッダーを作る' do
        zaiko = Zaiko.new
        zaiko.intconversion
        zaiko.add
        zaiko.add_header
        expect(zaiko.instance_variable_get(:@check)).must_equal ['商品名', '受入数', '商品A', 6, '商品B', 6, '商品C', 10]
      end
    end
    describe '#write' do
      it 'CSVファイルを出力する' do
        zaiko = Zaiko.new
        zaiko.intconversion
        zaiko.add
        zaiko.add_header
        zaiko.write
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
