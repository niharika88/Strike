# README
## Synopsis

# Bowling exercise: Strike!

Background
Strike! is a bowling club. They need help to keep score automatically on
competitions and avoid human errors from the judges.
On competitions there are 10 frames. In each frame the player has the opportunity
to try to take down the pins twice and there are 10 pins on the start of each try.
The rules are the following:
- If the player knocks down less than 10 pins during 2 tries on the same frame,
his/her score is the sum of the pins they’ve knock down in the 2 attempts.
- If the player knocks down all the 10 pins during 2 tries on the same frame
(spare), his/her score is the sum of the pins knocked down on the spare (10),
plus the number of pins knocked down in the next try.
Example: try 1(spare): 3|7, try 2: 3|4, score try 1: 13, score try 2: 7, total: 20
- If the player knocks down all 10 pins on the first try (strike), his/her score is
the sum of pins knocked down on the strike (10) plus the number of pins
knocked down on the next 2 tries.
Example: try 1(strike): 10|/, try 2: 3|4, score try 1: 17, score try 2: 7, total: 24

## Code Example

```

/* small snipet for score calculation and status update */

self.score = self.try1 + self.try2
    if ((score) ==  10 && (self.try1 != 0 && self.try2 != 0))
      self.status = "spare"
    elsif ((score) ==  10 && (self.try1 == 0 || self.try2 == 0))
      self.status = "strike"
    else
      self.status = "none"
    end
    total_score = self.game.score_board[self.user_id]
    total_score += self.score
```

## Motivation

This Project is developed for a hiring challenge for problem solving and system design.

## Installation

Steps and instruction for Application Setup:

* Ruby version: 2.3.2 (rvm installed)

* Rails version: 5+

* System dependencies: MAC OS, Linux, Browser (Mozilla Firefox) (Please do not use chrome for this aplication as the presentation for frontend might significantly differ)

* Database creation: rake db:create, rake db:migrate

* Startup instructions: 

```
* Step 1 => git clone 
* Step 2 => cd Strike
* Step 3 => rake db:create
* Step 4 => rake db:migrate
* Step 5 => bundle install 
* Step 6 => rails s
* Step 7 => rspec .
```

## Tests

run the test suite: Rspec is used ( rspec .) --command for test suit

## Deployment

Heroku: ``` https://arcane-bayou-87876.herokuapp.com/games```

## Steps for Playing the game

* run the rails server
* open localhost/games (if using locally)
* Open mozila firefox (load the application url:```https://arcane-bayou-87876.herokuapp.com/games ```) (if using heroku)
* go to /games
* add players for first time game entry
* click on add players and make players for game
* go to /games and click on start game 
* choose players/player for game
* create your new game (You can create multiple games and players for your arena)
* enter bowling arena
* click on ```play your turn```
* start your turns and enter the tries and turn info in each frame 
* click create frame
* continue same for other player as well
* the game turn will update once each player has finished their current turns
* once the game hits 10th turn , the game is finished
* go to game dashboard to check for winner and score
* you can also go to the dashboard in between the play to check winners and score for present turn
* In each game card of game dashboard the ```Bowling Arena button``` is there which will bring you back to player dashboard
* You can check the dashboard for Multiple Games

## Asumptions and Comments

* The game is only for 10 turns and no bonus trun is there for special case, if last throw is strike or spare (for simplicity of execution)
* The game in future can be extended for the implementation of bonus frame
* The game works best in Mozila Firefox, avoid using Chrome.
* In case of multiple players securing higest scores, then only one player is chosen to be winner the first one on the list.










