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

  def is_valid?(current_guess)
    /^[a-zA-z]{1}$/ === current_guess && !self.guess.include?(current_guess)
  end

  def game_over
    self.turns.zero? || complete_word?(self.answer,self.guess)
  end

  def complete_word?(ans,guess)
    ans.chars.all? { |c| guess.include?(c) }
  end

  def turn_count(guess)
    self.turns -= 1 unless self.answer.include?(guess)
  end

end
