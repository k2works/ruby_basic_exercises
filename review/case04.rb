### next　例外


class Shuke
 ##初期化メソッド 出力配列、入力配列、計算に必要な関数を作成
    def initialize(inp)
        #出力配列
        @input=[]
        inpmake(inp)
        #入力配列
        @output = Array.new(@input.count, nil)        
        outmake
#作成配列確認   p @input,@output        
        #重複回避用スイッチ
        @b=0
        #集計用の要素数
        @c=1   
    end

    ##inputdataを配列に格納するメソッド
    def inpmake(inp)
        open(inp) do |file|
            file.each do |s|
              @input << s.chomp.split(",")            
            end 
        end
    end
    
    ##集計用の配列のを作成するメソッド
    def outmake 
        @output.length.times{ |i|            
            @output[i] = Array.new(2, 0)   
        } 
    end

    ##配列@inputの文字を数値化するメソッド
    def sutika
        (@input.count-1).times do |i|
            @input[i+1][1]=@input[i+1][1].to_i
        end       
    end

    ##集計用のメソッド
    def shukei
            #outputに入れていくのでinputの列の全判定
            (@input.count).times do |i|
                #重なりを判定
                @c.times do |j|
                    if(@input[i][0]==@output[j][0])
                        @output[j][1]+=@input[i][1]
                        #ダブり回避スイッチおん
                        @b=1
                    end
                end
                #新規格納
                if(@b==0&&i!=0)
                    @output[@c][0]=@input[i][0]
                    @output[@c][1]=@input[i][1]
                    @c+=1                
                #要素名を[0]に格納
                else
                    @output[0][0]=@input[0][0]
                    @output[0][1]=@input[0][1]
                end
            #重複回避の初期化
            @b=0
            end
#計算結果確認       p @output
    end

    ##makeメソッド呼び出し用のメソッド
        def outp(out)            
                make(out)
        end

    ##csv作成メソッド
    def make(out)
        open(out,'w') do |f|
            #一行
                @c.times do |j|
                     f.write(@output[j][0])
                     f.write(",")
                     f.write(@output[j][1])
                     f.write("\n")
                end
        end
    end
end


#クラス作成
a=Shuke.new("YYYYMMDD_INPUT.csv")
#数値化
a.sutika
#集計
a.shukei
#出力
a.outp('YYYYMMDD_OUTPUT.csv')