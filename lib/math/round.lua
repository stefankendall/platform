local round = {}
round.round = function(value)
    return math.floor(value + 0.5)
end
round.toNearest = function(value, multiple)
    return math.floor(((value + multiple / 2) / multiple)) * multiple
end
return round