# frozen_string_literal: true

class Case03
  def self.execute
    # YYYYMMDD には作成年月日が入る
    file_path = '20180701_INPUT.csv'
    file_path2 = '20180701_OUTPUT.csv'
    data = []
    a = ''
    open(file_path, mode = 'r') do |f|
      i = 0
      f.each_line do |line|
        data[i] = line.chomp
        i += 1
      end
    end
    i = 0
    data.each do |a|
      data[i] = a.split(',')
      i += 1
    end

    data_body = data.dup
    data_header = { item: data.first[0], amount: data.first[1] }
    data_body.shift
    data_body = data_body.map { |id, num| [id, num.to_i] }
                    .group_by(&:first)
                    .map { |id, items| { item: id, amount: items.map(&:last).reduce(:+) } }

    open(file_path2, mode = 'w') do |f|
      f.puts("#{data_header[:item]},#{data_header[:amount]}")
      data_body.each do |data|
        f.puts("#{data[:item]},#{data[:amount]}")
      end
    end
  end
end
