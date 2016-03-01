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

  def game_over
    self.turns.zero? || complete_word?(self.answer,self.guess)
  end

  def complete_word?(ans,guess)
    ans.chars.all? { |c| guess.include?(c) }
  end

#TODO: finish this piece... but first... need validation piece working
#since it's contingient.
  def turn_count
    #self.turns =- 1 unless self.answer.include?(need from validation piece, guess
    #from post param form b4 post param is potientially stored in the db)
  end

end
