fileName := "input.txt"
file := File with(fileName)
file open
input := file readToEnd
file close

elfPairs := input split("\n")

score := 0
elfPairs foreach(elfPair, 
    range1 := elfPair split(",") at(0)
    range2 := elfPair split(",") at(1)

    nums := range1 split("-")
    num1 := nums at(0) asNumber
    num2 := nums at(1) asNumber
    newRange1 := list()
    for(i, num1, num2, newRange1 append(i))

    nums := range2 split("-")
    num1 := nums at(0) asNumber
    num2 := nums at(1) asNumber
    newRange2 := list()
    for(i, num1, num2, newRange2 append(i))

    inc := if(newRange1 containsAny(newRange2), 1, 0) 
    inc := (if(newRange2 containsAny(newRange1), 1, 0) + inc)
    if(inc == 2, inc println
        inc := 1)

    score := score + inc
)

score println
