class Game < ActiveRecord::Base
  serialize :guess,Array
end
