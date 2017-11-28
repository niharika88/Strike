class Game < ApplicationRecord
	serialize :score_board
	serialize :winner

	has_many :frames


  before_create :init

    def init
    	self.score_board = {}
    	(1..self.players).each do |x|
      self.score_board.merge!(x => 0) 
      end   
      self.winner = {0 => 0}
    end

end
