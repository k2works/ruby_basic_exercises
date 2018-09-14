# frozen_string_literal: true

require 'csv'

class Stock
  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @data_list = []
    @merged_output_data_list = []
    @output_data_list = []
  end

  def goods_received
    read_csv_file
    setup_csv_header
    summary_csv_data
    output_csv_file
  end

  private

  def output_csv_file
    CSV.open(@output_file, 'w') do |output_line|
      output_line << [@shouhinnmei, @ukeiresu]
      @merged_output_data_list.each do |input_line|
        output_line << [input_line[:shouhinnmei], input_line[:ukeiresu]]
      end
    end
  end

  def summary_csv_data
    @data_list.each do |data|
      data_hash = { shouhinnmei: data[0], ukeiresu: data[1].to_i }
      @output_data_list << data_hash
    end
    @merged_output_data_list = @output_data_list.flatten.map(&:values).group_by(&:first).map { |id, items| { shouhinnmei: id, ukeiresu: items.map(&:last).inject(:+) } }
  end

  def setup_csv_header
    header = @data_list.first
    @shouhinnmei = header[0]
    @ukeiresu = header[1]
    @data_list.shift
  end

  def read_csv_file
    @data_list = CSV.read(@input_file)
  end
end
