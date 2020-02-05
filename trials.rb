# Monty Hall Problem
#
# Game Logic
#
# There are 3 doors with items behind them - 1 car and 2 goats. Winning is to pick the door with the car
# 1) Choose one of the doors
# 2) Between the two doors that were not chosen a door with a goat behind it is ralways evealed, no longer a selectable door
# 3) Given choice between staying with your door you choose in the beginning or switching to the remaining door that was not revealed
#
# GOAL Prove that if you always switch your door you have a 2/3 chance of getting the car vs always staying with your door which is 1/3 chance
#
# Steps To Solve
# 1)  Create variables to track win for both staying and switching over multiple runs
# 2)  Start Run with create array of doors and shuffle positions each loop
# 3)  Make random selection of which door to choose
# 4)  Check contents of the door
# 4a) If door contains the car
#     One of the two goat doors in opened, the switchable door contains a goat
#     Staying would result in ending with the car, staying wins - increment stay wins counter is increased by 1
#     Switching would only have a chance to switch to a goat door, meaning switching would lose - switch wins counter stays the same
# 4b) If door contains the goat
#     The door containing the other goat is opened, the switchable door contains the car
#     Staying would result in ending with the goat, staying would lose - stay wins counter stays the same
#     Switching would end up in choosing the car, switching wins - increment switch wins by 1
# 5)  Rerun steps 2 - 4 for as many trials as passed in
# 6)  Output totals win by both for comparison between both along with win percentage based on trails ran

def monty_hall_proof(trials)
    #tracker for conditions wins
    switch_wins = 0
    stay_wins = 0

    #run logic as many trial as desired
    trials.times do 
        #create doors array with 2 goats(false) and 1 car(true) and shuffle position each loop
        doors = [true, false, false].shuffle

        #make random selection of which door to choose initially
        selection = doors.slice!(rand(doors.length))

        #if the car is behind the choosen door, always staying would win
        #if the car is behind the choosen door, switching would always lose since the only choices left are goats(false)
        #this is the only case staying wins and switching loses, therefore 1/3 chance losing if you switch
        if selection
            stay_wins += 1
        #if selection isnt correct the other goat(false) is revealed meaning the switch chooses the only other door with the car(true) therefore winning
        #if selection isnt correct staying would leave you with a goat(false) thwerefore losing
        else
            switch_wins += 1
        end
    end

    puts "Win_Pct: #{(stay_wins/trials.to_f * 100).round(2)}%       Total Stay Wins:   #{stay_wins} "
    puts "Win_Pct: #{(switch_wins/trials.to_f * 100).round(2)}%       Total Switch Wins: #{switch_wins} "
end

monty_hall_proof(10000)