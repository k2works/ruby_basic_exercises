# frozen_string_literal: true

require 'csv'

class CsvStockData
  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @data = []
    @data_header = {}
    @data_body = []
  end

  def create_summary_data
    read_file
    setup_header
    setup_body
    output_file(summary_data)
  end

  private

  def output_file(summary_data)
    CSV.open(@output_file, 'w') do |output_line|
      output_line << [@data_header[:shouhinnmei], @data_header[:ukeiresu]]
      summary_data.each do |input_line|
        output_line << [input_line[:shouhinnmei], input_line[:ukeiresu]]
      end
    end
  end

  def summary_data
    output_data_list = @data_body.map { |id, num| { shouhinnmei: id, ukeiresu: num.to_i } }
    output_data_list
      .flatten
      .map(&:values)
      .group_by(&:first)
      .map { |id, items| { shouhinnmei: id, ukeiresu: items.map(&:last).inject(:+) } }
  end

  def setup_body
    @data_body = @data.dup
    @data_body.shift
  end

  def setup_header
    header = @data.first
    @data_header = { shouhinnmei: header[0], ukeiresu: header[1] }
  end

  def read_file
    @data = CSV.read(@input_file)
  end
end

class Stock
  def initialize(data)
    @data = data
  end

  def goods_received
    @data.create_summary_data
  end
end
