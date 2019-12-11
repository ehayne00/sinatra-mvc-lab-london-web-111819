require 'pry'

class PigLatinizer
    attr_reader :user_phrase

    def initialize(user_phrase)               
        @user_phrase = user_phrase             
    end                               
                                       
    def split_words 
       user_phrase.split(" ") #=> ["red", "blue", "yellow"]
    end

    def formulate_pig_latin_word
      array = []
        split_words.each{|word| if word.slice(0).scan(/[aeiou]/) == true
         array << "#{word}way"
     elsif word.slice(0).scan(/[bcdfghjklmnpqrstvwxyz]/) == true && word.slice(1).scan(/[bcdfghjklmnpqrstvwxyz]/) == true && word.slice(2).scan(/[bcdfghjklmnpqrstvwxyz]/) == true
        shifted_letters = word.shift(0,1,2)
        new_word = word.push(shifted_letters) #^ may have to put an == true,between each &&
        array << "#{new_word}ay"
     elsif word.slice(0).scan(/[bcdfghjklmnpqrstvwxyz]/) == true && word.slice(1).scan(/[bcdfghjklmnpqrstvwxyz]/) == true && word.slice(2).scan(/[aeiou]/) == true
        shifted_letters2 = word.shift(0,1)
        new_word2 = word.push(shifted_letters2)
        array << "#{new_word2}ay"
     elsif word.slice(0).scan(/[bcdfghjklmnpqrstvwxyz]/) == true && word.slice(1).scan(/[aeiou]/) == true
        shifted_letter = word.shift(0)
        new_word3 = word.push(shifted_letter)
        array << "#{new_word3}ay"
     end}
     array
    end

    def rejoin_string
      formulate_pig_latin_word.join(" ")
    end



end

# def count_of_words
#     words = text.split(" ")
#     words.count
#   end
 
#   def count_of_vowels
#     text.scan(/[aeoui]/).count
#   end
 
#   def count_of_consonants
#     text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
#   end