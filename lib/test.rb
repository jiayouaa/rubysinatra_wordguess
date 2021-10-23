def word_with_guesses(guesses,displayed)
    #wGG= WordGuesserGame.new(displayed)
    res=''
    i=0
    n=displayed.length
    while i < n  do
      res +="-"
      i+=1
    end
    puts res
    for i in 0...(guesses.length)
      for j in 0...(displayed.length)
        if displayed[j] == guesses[i]
          res[j]=guesses[i]
        end
      end 
    end
    puts res
    return res
end
word_with_guesses('xy','bnana')

# def guess(word,guesses,wrong_guesses,letter)
#     begin
#         if letter==''  
#             raise 'empty'  
#         end
#         if letter.nil?
#             raise 'nil'  
#         end
#         if !(letter=~ /[A-Za-z]/ )
#             raise 'not a letter'  
#         end
        
      
#     if letter=~ /[A-Z]/
#         puts 'is case insensitive'
#         return false
#     end
#     t1=0
#     t2=1
#     t3=1
#     for i in 0...(word.length)
#         if  word[i]==letter
#             t1=1
#             break
#         end
#     end
#     for i in 0...(guesses.length)
#         if  guesses[i]==letter
#             t2=0
#             return false
#         end
#     end
#     if t1==1 and t2==1
#         guesses+=letter;
#         puts guesses
#     end
    
#     if t1==0
#         for i in 0...(wrong_guesses.length)
#             if  wrong_guesses[i]==letter
#                 t3=0
#                 return false
#             end
#         end
#     end

#     if t1==0 and t3==1
#         wrong_guesses+=letter;
#         puts wrong_guesses
#     end
#     return true 
    
#     rescue Exception => e  
#     puts e.message  
#     puts e.backtrace.inspect  
#     end

# end

# puts guess('garply','','','a')
# puts guess('garply','','','z')
# puts guess('garply','a','','a')
# puts guess('garply','','q','q')
# guess('garply','','','')
# guess('garply','','','%')
# puts guess('garply','','','A')
# puts guess('garply','','',nil)

# # def check_win_or_lose(guesses,word,wrong_guesses)
# #     if display(guesses,word)==word
# #         puts 'win'
# #         return 'win'
# #     end
# #     if wrong_guesses.length>7
# #         puts 'lose'
# #         return 'lose'
# #     else
# #         puts 'play'
# #         return 'play'
# #     end
# # end

# # check_win_or_lose('odg','dog','')
# # check_win_or_lose('','dog','xxydhjhd')
# # check_win_or_lose('d','dog','')
