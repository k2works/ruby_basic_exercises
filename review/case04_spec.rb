# frozen_string_literal: true

require 'minitest/autorun'
require '../review/case04_review'

class Uc04Spec < Minitest::Spec
  describe Zaiko do
    before do
      INPUT_FILE = '20180701_INPUT.csv'
      OUTPUT_FILE = '20180701_OUTPUT.csv'
      File.delete(OUTPUT_FILE) if File.exist?(OUTPUT_FILE)
    end

    describe '#initialize' do
      it '初期化メソッド 出力配列、入力配列、計算に必要な関数を作成' do
        shuke = Zaiko.new(INPUT_FILE)
        expect( shuke.instance_variable_get(:@input)).must_equal [["商品名", "受入数"], ["商品A", "1"], ["商品A", "1"], ["商品A", "1"], ["商品A", "1"], ["商品A", "1"], ["商品A", "1"], ["商品B", "1"], ["商品B", "2"], ["商品B", "3"], ["商品C", "10"]]
        expect( shuke.instance_variable_get(:@output)).must_equal [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
      end
    end

    describe '#shukei_file_sakusei' do
      it 'CSVファイルを出力する' do
        zaiko = Zaiko.new(INPUT_FILE)
        zaiko.shukei_file_sakusei(OUTPUT_FILE)
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
