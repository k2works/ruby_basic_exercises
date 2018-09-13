# frozen_string_literal: true

require 'minitest/autorun'
require '../review/case01_review'

class Uc02Spec < Minitest::Spec
  describe Uc02 do
    describe '#intconversion' do
      it '配列に変換する' do
        uc02 = Uc02.new
        expect(uc02.intconversion).must_equal ['商品名,受入数', '商品A,1', '商品A,1', '商品A,1', '商品A,1', '商品A,1', '商品A,1', '商品B,1', '商品B,2', '商品B,3', '商品C,10']
      end
    end
    describe '#add' do
      it '配列を集計する' do
        uc02 = Uc02.new
        uc02.intconversion
        uc02.add
        expect(uc02.instance_variable_get(:@check)).must_equal ['商品名', 0, '商品A', 6, '商品B', 6, '商品C', 10]
      end
    end
    describe '#add_headfer' do
      it 'ヘッダーを作る' do
        uc02 = Uc02.new
        uc02.intconversion
        uc02.add
        uc02.add_header
        expect(uc02.instance_variable_get(:@check)).must_equal ['商品名', '受入数', '商品A', 6, '商品B', 6, '商品C', 10]
      end
    end
    describe '#write' do
      it 'CSVファイルを出力する' do
        uc02 = Uc02.new
        uc02.intconversion
        uc02.add
        uc02.add_header
        uc02.write
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
