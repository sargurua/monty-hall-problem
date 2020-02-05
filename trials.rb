def monty_hall(trials)
    #tracker for conditions wins
    switch_wins = 0
    stay_wins = 0

    trials.times do 
        #create doors array with 2 goats(false) and 1 car(true) and shuffle position each loop
        doors = [true, false, false].shuffle

        #make random selection of which door to choose initially
        selection = doors.slice!(rand(doors.length))

        #if the car is behind the choosen door, always staying would win
        #if the car is behind the choosen door, switching would always lose since the only choices left are goats(false)
        if selection
            stay_wins += 1
        else #if selection isnt correct the other goat(false) is revealed meaning the switch chooses the only other door with the car(true) therefore winning
            switch_wins += 1
        end
    end

    puts "Stay Wins: #{stay_wins} Win Pct: #{(stay_wins/trials.to_f * 100).round(2)}%"
    puts "Switch Wins: #{switch_wins} Win Pct: #{(switch_wins/trials.to_f * 100).round(2)}%"
end

monty_hall(10000)