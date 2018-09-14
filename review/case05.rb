# frozen_string_literal: true

require 'csv'

class Stock
  def initialize(input_file)
    @input_file = input_file
  end

  def output_csv_file
    @data_list = CSV.read(@input_file)
    header = @data_list.first
    @shouhinnmei = header[0]
    @ukeiresu = header[1]

    @data_list.shift
    @output_data_list = []
    @data_list.each do |data|
      data_hash = { shouhinnmei: data[0], ukeiresu: data[1].to_i }
      @output_data_list << data_hash
    end

    @merged_output_data_list = @output_data_list.flatten.map(&:values).group_by(&:first).map { |id, items| { shouhinnmei: id, ukeiresu: items.map(&:last).inject(:+) } }

    CSV.open('20180731_OUTPUT.csv', 'w') do |output_line|
      output_line << [@shouhinnmei, @ukeiresu]
      @merged_output_data_list.each do |input_line|
        output_line << [input_line[:shouhinnmei], input_line[:ukeiresu]]
      end
    end
  end
end
