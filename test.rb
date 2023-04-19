#!/usr/bin/ruby
#load 'test.rb' in the irb to see changes

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
        if !calculate.empty? && scores[index].is_a?(Integer)
            if spare 
                results.push(10 + scores[index])
                calculate[0] = scores[index]
                spare = false
            # calculate spare frame
            elsif strike 
                c = 2
            # calculate regular frame
            else 
                results.push(scores[index-1] + scores[index]) 
                calculate = []
            end 
        # progress a spare frame
        elsif !calculate.empty? && scores[index] == "/" 
            spare = true
            calculate.push(10-scores[index-1])
        # progress a strike frame 
        elsif !calculate.empty? && scores[index] == "X"
            b = 3
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

    # puts "([4, 5, 3, 2, 1]) test passed: #{running_score([4, 5, 3, 2, 1])  == [9, 5, nil]}"
    # puts "([4, 5, 3, 2, 1, 3]) test passed: #{running_score([4, 5, 3, 2, 1, 3])  == [9, 5, 4]}"
    
    # puts "(['X']) test passed: #{running_score(['X'])  == [nil]}"
    # puts "([3, '/']) test passed: #{running_score([3, '/'])  == [nil]}"
    # puts "(['X', 2, '/']) test passed: #{running_score(['X', 2, '/'])  == [20, nil]}"
    # puts "(['X', 2, '/', 4]) test passed: #{running_score(['X', 2, '/', 4])  == [20, 14, nil]}"
    # puts "(['X', 2, '/', 4, 3]) test passed: #{running_score(['X', 2, '/', 4])  == [20, 14, 7]}"
    
    
    # puts "([3, '/']) test passed: #{running_score([3, '/'])  == [nil]}"
    # puts "([3, '/', 1]) test passed: #{running_score([3, '/', 1])  == [11, nil]}"
    # puts "([3, '/', 1, '/']) test passed: #{running_score([3, '/', 1, '/'])  == [11, nil]}"
    # puts "([3, '/', 1, '/', 'X']) test passed: #{running_score([3, '/', 1, '/', 'X']) == [11, 20, nil]}"
    # puts "([3, '/', 1, '/', 'X', 5]) test passed: #{running_score([3, '/', 1, '/', 'X', 5])  == [11, 20, nil, nil]}"
    # puts "([3, '/', 1, '/', 'X', 5, 2]) test passed: #{running_score([3, '/', 1, '/', 'X', 5, 2])  == [11, 20, 27, 7]}"
end 













