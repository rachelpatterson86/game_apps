class Game < ActiveRecord::Base
  serialize :guess,Array

  def self.select_word
    words = []
    word = ""
    File.open('lib/english-dict.txt','r').each do |f|
      words << f.delete!("\n")
    end
    word = words.sample
  end

  def display_partial_word(ans,guess)
    partial_word = ""
    ans.each_char do |c|
    guess.include?(c) ? partial_word << c : partial_word << '_'
    partial_word << " "
   end
    partial_word
  end

end
