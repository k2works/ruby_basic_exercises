# frozen_string_literal: true

class Zaiko
  ON = 1
  OFF = 0
  def initialize(inp)
    @input = []
    set_inputdata_hairetu(inp)
    @output = Array.new(@input.count, nil)
    create_outputdate_hairetu
    @jyufuku_kaihi_flg = OFF
    @shukei_youso_su = ON
  end

  def shukei_file_sakusei(outp)
    convert_input_sutika
    shukei
    outp(outp)
  end

  private

  def set_inputdata_hairetu(inp)
    open(inp) do |file|
      file.each do |s|
        @input << s.chomp.split(',')
      end
    end
  end

  def create_outputdate_hairetu
    @output.length.times do |i|
      @output[i] = Array.new(2, 0)
    end
  end

  def convert_input_sutika
    (@input.count - 1).times do |i|
      @input[i + 1][1] = @input[i + 1][1].to_i
    end
  end

  def shukei
    @input.count.times do |i|
      kasanari_hantei(i)
      sinki_kakunou(i)
      @jyufuku_kaihi_flg = OFF
    end
  end

  def outp(out)
    make_csv(out)
  end

  def make_csv(out)
    open(out, 'w') do |f|
      @shukei_youso_su.times do |j|
        f.write(@output[j][0])
        f.write(',')
        f.write(@output[j][1])
        f.write("\n")
      end
    end
  end

  def sinki_kakunou(i)
    if @jyufuku_kaihi_flg == 0 && i != 0
      @output[@shukei_youso_su][0] = @input[i][0]
      @output[@shukei_youso_su][1] = @input[i][1]
      @shukei_youso_su += 1
    else
      @output[0][0] = @input[0][0]
      @output[0][1] = @input[0][1]
    end
  end

  def kasanari_hantei(i)
    @shukei_youso_su.times do |j|
      if @input[i][0] == @output[j][0]
        @output[j][1] += @input[i][1]
        @jyufuku_kaihi_flg = ON
      end
    end
  end
end
