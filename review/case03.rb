# YYYYMMDD には作成年月日が入る
file_path = '20180720_INPUT.csv'
file_path2 = '20180913_OUTPUT.csv'
data = []
a = ""
open(file_path, mode = 'r') do |f|
     i =0
     f.each_line {|line|
     data[i]=line.chomp
     i+=1
    }
end
i = 0
data.each{|a|
     data[i] = a.split(",") 
     i+=1
} 

open(file_path2, mode = 'w') do |f|
    data.each do |y|
      f.write(y)
          f.write("\n")
      end
        
    end
    
    



