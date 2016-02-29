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

end
