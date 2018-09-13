class Zaiko
    def initialize(input,output)
        @file_path1 = input
        @file_path2 = output
        @data=[]
        @shou=[]
        @su=[]
    end

    def create_summary_file
        read
        summary
        write
    end

    private
    def write
        File.open(@file_path2, 'w') do |f|
            f.write("商品名,受入数")
            f.write("\n")
            (@shou.count).times do |a|
                f.write(@shou[a])
                f.write(",")
                f.write(@su[a])
                f.write("\n")
            end
        end
    end

    def summary
        i = 0
        @data.each do |d|
            @data[i] = d.split(",")
            i += 1
        end

        @data.each do |a|
            a[1] = a[1].to_i
        end
        i = 0

        @data.each do |d|
            c = @shou.index(d[0])
            if (c == nil)
                @shou << d[0]
                @su << d[1]
            else
                @su[c] += d[1]
            end
        end
    end

    def read
        File.open(@file_path1, mode = "r") do |f|
            i = 0
            f.gets
            f.each_line {|line|
                @data[i] = line.chomp
                i += 1
            }
        end
    end
end
