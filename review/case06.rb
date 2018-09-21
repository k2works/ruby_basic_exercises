class Case06
  def self.execute
    file_path = '20180701_INPUT.csv'


    in_data=[]
    open(file_path, 'r') do |file|
      file.gets
      file.each_line do |data|
        in_data.push(data.chomp)
      end
    end

#データ分解
    syouhin = []
    suuryou = []
    in_data.each do | d |
      syo, suu = d.split(",")
      syouhin.push(syo)
      suuryou.push(suu.to_i)
    end

#集計
    s_syou =[]
    s_gou  =[]
    syouhin.each_with_index do | d,i |
      ans = s_syou.index(d)
      if ans != nil
        s_gou[ans] += suuryou[i]
      else
        s_syou.push(d)
        s_gou.push(suuryou[i])
      end
    end
  end
end
