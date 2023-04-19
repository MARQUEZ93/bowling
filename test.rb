# Spare: 10 points + the number of pins you knock down for your first attempt at the next frame.
# Strike: score 10 points + the number of pins you knock down for the entire next frame.

# The method should accept an array of rolls.
# Possible values include zero through nine, a "/" indicating a spare, and an "X" indicating a strike.
# The scoring method will be used to calculate a player's running score during the game, 
# so it's important that the method works for games in progress.

def running_score scores
     
    spare = false
    strike = false
    results = []
    calculate = []

    scores.each_with_index do |val, index| 
        # calculate spare frame 
        if !calculate.empty? && val.is_a?(Integer)
            if spare
                # calculate spare on final elemnt 
                if calculate[-1] == "/" && index == (scores.size-1) 
                    results.push(10 + val)
                    results.push(nil)
                else 
                    results.push(10 + val)
                    calculate[0] = val
                    spare = false
                end 
            # calculate spare frame
            elsif strike 
                # calculate strike on final element
                if calculate[-1] == "X" && index == (scores.size-1)
                    results.push(nil)
                    results.push(nil)
                elsif calculate[-1] == "X"
                    calculate.push(val)
                else
                    last_val = calculate[1] === "X"  ? 10 : calculate[1]
                    results.push(10 + last_val + val)
                    results.push(last_val + val)
                    strike = false
                    calculate = []
                end 
            # calculate regular frame
            else 
                results.push(scores[index-1] + scores[index]) 
                calculate = []
            end 
        # progress a spare frame
        elsif scores[index] == "/" 
            if index == scores.length - 1
                if strike
                    strike = false
                    results.push(10 + 10)
                end 
                results.push(nil)
            elsif calculate[0] == "X"
                strike = false
                calculate = calculate.drop(1)
                results.push(10 + 10)
            end 
            calculate.push("/")
            spare = true
        # progress a strike frame 
        elsif val == "X"
            if spare
                calculate = [] 
                results.push(20)
                spare = false
            end 
            if strike
                results.push(20)
                calculate = ["X"]
            else 
                calculate.push("X")
            end
            # handle last element 
            if index == scores.length - 1
                results.push(nil)
            end  
            strike = true
        # progress a regular frame
        elsif calculate.empty? && val.is_a?(Integer)
            # handle final element
            if index === (scores.size-1)
                results.push(nil)
            else 
                calculate.push(val)
            end 
        end
    end 
    results
end

# The return value should be an array of scores for the frames the player has bowled. 
# ([4, 5, "X", 8]) should return ([9, nil, nil])
# ([4, 5, "X", 8, 1]) would return ([9, 19, 9])

def test 
    # regular frames
    puts "([3, 1, 5, 2]) test passed: #{running_score([3, 1, 5, 2])  == [4, 7]}"
    # regular frames ongoing
    puts "([3, 1, 5]) test passed: #{running_score([3, 1, 5])  == [4, nil]}"
    # ongoing strike
    puts "([4, 5, 'X', 8]) test passed: #{running_score([4, 5, 'X', 8])  == [9, nil, nil]}"
    # completed strike
    puts "([4, 5, 'X', 8, 1]) test passed: #{running_score([4, 5, 'X', 8, 1])  == [9, 19, 9]}"
    # more regular frames
    puts "([4, 5, 3, 2, 1]) test passed: #{running_score([4, 5, 3, 2, 1])  == [9, 5, nil]}"
    puts "([4, 5, 3, 2, 1, 3]) test passed: #{running_score([4, 5, 3, 2, 1, 3])  == [9, 5, 4]}"
    # ongoing frames w/ either strike or spare
    puts "(['X']) test passed: #{running_score(['X'])  == [nil]}"
    puts "([3, '/']) test passed: #{running_score([3, '/'])  == [nil]}"
    # handle both strike & spare rounds
    puts "(['X', 2, '/']) test passed: #{running_score(['X', 2, '/'])  == [20, nil]}"
    puts "(['X', 2, '/', 4]) test passed: #{running_score(['X', 2, '/', 4])  == [20, 14, nil]}"
    puts "(['X', 2, '/', 4, 3]) test passed: #{running_score(['X', 2, '/', 4, 3])  == [20, 14, 7]}"
    # all strikes
    puts "(['X', 'X','X']) test passed: #{running_score(['X','X','X'])  == [20, 20, nil]}"
    # many strikes w/ some spares 
    puts "(['X', 'X','2', '/', 'X']) test passed: #{running_score(['X', 'X','2', '/', 'X'])  == [20, 20, 20, nil]}"
    puts "(['X', 'X','2', '/', 'X', 'X']) test passed: #{running_score(['X', 'X','2', '/', 'X', 'X'])  == [20, 20, 20, 20, nil]}"
    # more crazy tests
    puts "([3, '/']) test passed: #{running_score([3, '/'])  == [nil]}"
    puts "([3, '/', 1]) test passed: #{running_score([3, '/', 1])  == [11, nil]}"
    puts "([3, '/', 1, '/']) test passed: #{running_score([3, '/', 1, '/'])  == [11, nil]}"
    puts "([3, '/', 1, '/', 'X']) test passed: #{running_score([3, '/', 1, '/', 'X']) == [11, 20, nil]}"
    puts "([3, '/', 1, '/', 'X', 5]) test passed: #{running_score([3, '/', 1, '/', 'X', 5])  == [11, 20, nil, nil]}"
    puts "([3, '/', 1, '/', 'X', 5, 2]) test passed: #{running_score([3, '/', 1, '/', 'X', 5, 2])  == [11, 20, 17, 7]}"
end 













