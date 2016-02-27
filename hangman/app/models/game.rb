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

    #add default values... turns 6
    # :answer - word function
    #(put below in db/migrate?)
    # :turns - default value is 6 (put that in DB/migrate)
    # :guess - initialize as nil (put in db?)
    # :state - initialize as in progress, only options in progress, completed, paused



end
