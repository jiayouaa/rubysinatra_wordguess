class WordGuesserGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service

  # 根据测试中的要求，这个类有三个属性，分别为word、guesses、wrong_guesses
  # 在实例化一个类得到对象的时候，需要传入一个词，将这个词的值传给word属性，所以@word = word
  # 而其他两个属性都为'',因为一开始还没有进行猜词，所以无论是猜对的字符串还是猜错的字符串都是空字符串
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses=''
  end
  def word
		@word
	end
	
	def guesses 
		@guesses
	end
	
	def wrong_guesses 
		@wrong_guesses
	end
  # geuss方法，形参为letter，一个字母，意思是当前猜的是这个letter，按照测试要求，如果letter是word中的一个词，那么猜对了
  # 这时需要检查那个猜对字符串中是否已经有这个字母了，因为要保证没有重复的字母，如果没有，则将这个字母拼接到猜对的字符串中
  #并返回true，如果已有，说明重复，什么也不做，返回false，如果letter不是word中的一个词，那么就是猜错的字母，查看猜错字符串中是否有这个字母，与
  #与猜对字符串处理方式一样，同时还要对传入参数是否合理进行判断。
  # 我是这样实现这个功能的，首先遍历word这个字符串，
  #查看有没有出现这个letter，然后再遍历猜对的字符串guesses，查看有没有出现这个字母，如果word中出现过这个字母，并且guesses中没有
  #则拼接，返回true，如果有，返回false,如果word中没有出现过这个字母，那么说明猜错了，遍历猜错字符串，如果猜错字符串中有这个字母
  #说明重复，return false，如果没有，则将这个字母拼接到猜错字符串后面，返回true
  #
  #根据测试要求，在一开始，就要判断传入的letter，是不是''，nil，非字母，这里我使用了ruby异常处理
  #我用的这种形式的
  # begin #开始
 
  #   raise.. #抛出异常
    
  #  rescue  Exception => e 
  #   $! #表示异常信息
  #   $@ #表示异常出现的代码位置
    
  #  end #结束
  #在判断是不是字母的时候，我使用了正则表达式letter=~ /[A-Za-z]/ ，简洁方便
  #还有根据测试要求，这个游戏是不区分大小写的，如果猜的letter是大写字母会返回flase,这里我也是通过正则表达式来判断的
  
  def guess(letter)
    begin
        if letter.nil? # 判断是否为nil
          raise ArgumentError  
        end
        if letter==''   # 判断是否为''
            raise ArgumentError 
        end
        if !(letter=~ /[A-Za-z]/ ) # 判断是否为字母
            raise ArgumentError  
        end
        
      
    if letter=~ /[A-Z]/ # 判断字母大小写
        puts 'is case insensitive'
        return false
    end
    t1=0
    t2=1
    t3=1
    for i in 0...(@word.length) # 判断letter是否在word中
        if  @word[i]==letter
            t1=1
            break
        end
    end
    for i in 0...(@guesses.length) # 判断letter是否在guesses中
        if  @guesses[i]==letter
            t2=0
            return false
        end
    end
    if t1==1 and t2==1 # 在word中但不在guesses中
        @guesses+=letter;
        puts @guesses
    end
    
    if t1==0
        for i in 0...(@wrong_guesses.length) # 判断letter是否在wrong_guesses中
            if  @wrong_guesses[i]==letter ## 不在word中但在wrong_guesses中
                t3=0
                return false
            end
        end
    end

    if t1==0 and t3==1 # 不在word中且不在wrong_guesses中
        @wrong_guesses+=letter;
        puts @wrong_guesses
    end

    return true

      # rescue Exception => e  
      # puts e.message  
      # puts e.backtrace.inspect  
    end 
  end

  #这个方法用于将guesses根据word展示出来，guesses中是猜对的不重复的字母
  # @test_cases = {
  #   'bn' =>  'b-n-n-',
  #   'def' => '------',
  #   'ban' => 'banana'
  # }
  #我是这样实现这个方法的，首先获取word的长度，初始化一个字符串res为'-----',-的个数是word的长度，然后遍历guesses，
  #在这个遍历的内部去遍历word，如果遍历到word中的字母等于guesses的字母，就去修改与res中与word同一位置的字符，将'-'修改为遍历到的那个字母
  def word_with_guesses()
    res=''
    i=0
    n=@word.length
    while i < n  do # 初始化res '---...--'
      res +="-"
      i+=1
    end
    puts res
    for i in 0...(@guesses.length)
      for j in 0...(@word.length)
        if @word[j] == @guesses[i] # 相等
          res[j]=@guesses[i] # 修改res
        end
      end 
    end
    puts res
    return res
  end
#检查游戏状态，如果guesses经由上述word_with_guesses方法得到的结果与word相等，那么游戏成功；如果wrong_guesses的长度大于7，
#则游戏失败，这两种情况之外就是继续进行游戏
  def check_win_or_lose()
    if word_with_guesses()==@word # guesses经由word_with_guesses方法得到的结果与word相等，成功
        puts 'win'
        return :win
    end
    if @wrong_guesses.length>=7 # wrong_guesses的长度大于7，失败
        puts 'lose'
        return :lose
    else # 接着玩
        puts 'play'
        return :play
    end
  end
# game1=WordGuesserGame.new ('apple')
# game1.guess('a')
# game1.word_with_guesses()
# game1.check_win_or_lose()


  # You can test it by installing irb via $ gem install irb
  # and then running $ irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGuesserGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.new('randomword.saasbook.info').start { |http|
      return http.post(uri, "").body
    }
  end

end
