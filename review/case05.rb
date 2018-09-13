# frozen_string_literal: true
require 'csv'

class Stock
  def initialize(input_file)
    @input_file = input_file
  end

  def output_csv_file
    data_list = CSV.read(@input_file)
    CSV.open('20180731_OUTPUT.csv', 'w') do |output_line|
      data_list.each do |input_line|
        output_line << input_line
      end
    end
  end
end
