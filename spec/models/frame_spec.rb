require 'rails_helper'

RSpec.describe Frame, :type => :model do

	before(:each) do
    @user = User.create(:name => "Niharika")
    @user1 = User.create(:name => "Akhil")
    @game = Game.create(:game_turn => 1, :players => 1)
    @game.score_board ={ 1 => 0}
    @game.winner = {}
    @game.save
    @game1 = Game.create(:game_turn => 1, :players => 2)
    @game1.score_board ={ 1=> 0, 2 => 0}
    @game1.winner = {}
    @game1.save

  end
  it "is valid with valid attributes" do
  	expect(Frame.new(:user_id => @user.id, :game_id => @game.id,:try1 => 1, :try2 => 2, :turn =>  1)).to be_valid
  end
  it "is not valid without a turn" do
  	frame = Frame.new(:turn => nil,:user_id => @user.id, :game_id => @game.id,:try1 => 1, :try2 => 2)
    expect(frame).to_not be_valid

  end
  it "is not valid without try 1" do
     frame = Frame.new(:turn => 1,:user_id => @user.id, :game_id => @game.id,:try1 => nil, :try2 => 2)
    expect(frame).to_not be_valid
  end
  it "is not valid without try 2" do
  	frame = Frame.new(:turn => 1,:user_id => @user.id, :game_id => @game.id,:try1 => 1, :try2 => nil)
    expect(frame).to_not be_valid
  end
  it "is not valid without a game" do
  	frame = Frame.new(:turn => 1,:user_id => @user.id, :game_id => nil ,:try1 => 1, :try2 => 2)
    expect(frame).to_not be_valid
  end
  it "is not valid without a user" do
  	frame = Frame.new(:turn => 1,:user_id => nil, :game_id => @game.id,:try1 => 1, :try2 => 2)
    expect(frame).to_not be_valid
  end
  
  it "is a strike" do
  	frame = Frame.new(:turn => 1,:user_id => @user.id, :game_id => @game.id,:try1 => 10, :try2 => 0)
  	frame.save
    expect(frame.status).to eq("strike")
  end

  it "is a spare" do
  	frame = Frame.new(:turn => 1,:user_id => @user.id, :game_id => @game.id,:try1 => 4, :try2 => 6)
  	frame.save
    expect(frame.status).to eq("spare")
  end

  it "is a none (non strike non spare" do
  	frame = Frame.new(:turn => 1,:user_id => @user.id, :game_id => @game.id,:try1 => 2, :try2 => 0)
  	frame.save
    expect(frame.status).to eq("none")
  end

  it "is updating the game scorebord" do
  	frame = Frame.new(:turn => 1,:user_id => @user.id, :game_id => @game.id,:try1 => 2, :try2 => 0)
  	frame.save
    expect(frame.game.score_board[@user.id]).to eq(2)
  end

  it "is updating the winner" do
  	frame = Frame.new(:turn => 1,:user_id => @user.id, :game_id => @game.id,:try1 => 2, :try2 => 0)
  	frame.save
    expect(frame.game.winner[@user.id]).to eq(2)
  end

  it "updates winner correctly for multiple players" do
  	frame1 = Frame.new(:turn => 1,:user_id => @user.id, :game_id => @game1.id,:try1 => 2, :try2 => 1)
  	frame1.save

  	frame2 = Frame.new(:turn => 1,:user_id => @user1.id, :game_id => @game1.id,:try1 => 2, :try2 => 6)
  	frame2.save

  	expect(frame2.game.winner[@user1.id]).to eq(8)
  end
end