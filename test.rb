# The method should accept an array of rolls.
# Possible values include zero through nine, a "/" indicating a spare, and an "X" indicating a strike.

# require "./lib/src/bowling" in rails console
def sum_bowling scores
    res = []
    current = 0
    for i in scores 
        res.push(nil) if scores[current] == "X"
        res.push(nil) if scores[current] == "/"
            res.push(nil)
        elsif 
        res.push(val)
    end 
    res
end
# The return value should be an array of scores for the frames the player has bowled. 
# [4, 5, "X", 8] should return [9, nil, nil]
# [4, 5, "X", 8, 1] would return [9, 19, 9]