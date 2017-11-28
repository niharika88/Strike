class Frame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  # calculate score for a frame and update total
  def score_frame(try1, try2)
    self.score = try1.to_i + try2.to_i
    if ((score) ==  10 && (try1.to_i != 0 && try2.to_i != 0))
      self.status = "spare"
    elsif ((score) ==  10 && (try1.to_i == 0 || try2.to_i == 0))
      self.status = "strike"
    else
      self.status = "none"
    end

    total_score =  self.game.score_board[self.user_id]
    total_score += self.score


    if (self.turn > 1 && self.turn < 11)
      prev = Frame.where("turn = ? and user_id = ?", (self.turn-1), self.user_id).last
      if (prev.status == "strike")
        new_score = prev.score + self.score
        prev.update_attributes(:score => new_score)
        total_score += self.score
      elsif (prev.status == "spare")
        new_score = prev.score + self.try1
        prev.update_attributes(:score => new_score)

        total_score += self.try1
      else
      	total_score = total_score
      end
      self.game.score_board.merge!(self.user_id => total_score)
    else
    	self.game.score_board.merge!(self.user_id => total_score)
    end
    self.game.winner = self.game.score_board.max_by{|k,v| v}
    self.game.save!
  end
end
