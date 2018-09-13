class Zaiko
    def initialize
        @insdate = []
        open('20180701_INPUT.csv', 'r') do |f|
            @insdate = f.read
        end
    end

    def summary_file_output
        intconversion
        add
        add_header
        write
    end

    def intconversion
        str = @insdate
        s1 = []
        s1 = str.split("\n")
        s2 = []
        @s3 = []
        i = 0
        s1.each do |s|
            s2 = s.split(",")
            @s3[i] = s2[0]
            @s3[i+1] = s2[1].to_i
            i+=2
        end
    end

    def add
        cn1 = 0
        cn2 = 2
        @check = []
        fg = 0
        @check[0] = @s3[0]
        @check[1] = @s3[1]
        until(@s3[cn2] == nil) do
            loop do
                if @check[cn1] == @s3[cn2]
                    fg = 1
                    break
                elsif @check[cn1+2] == nil
                    cn1 += 2
                    fg = 2
                    break
                end
                cn1+=2
            end
            if fg == 1
                @check[cn1+1] += @s3[cn2+1]
            elsif fg == 2
                @check[cn1] = @s3[cn2]
                @check[cn1+1] = @s3[cn2+1]
            end
            cn2 += 2
            cn1 = 0
        end
    end

    def add_header
        @check[1] = '受入数'
    end

    def write
        lf = 0
        open('20180701_OUTPUT.csv', 'w') do |f|
            until(@check[lf] == nil) do
                f.puts("#{@check[lf]},#{@check[lf+1].to_s}")
                lf += 2
            end
        end
    end
end
