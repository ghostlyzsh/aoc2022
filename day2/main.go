package main

import ("fmt"
    "os"
    "strings"
)

func check(e error) {
    if e != nil {
        panic(e)
    }
}

func main() {
    data, err := os.ReadFile("input.txt")
    check(err)
    input := strings.TrimSpace(string(data))

    games := strings.Split(input, "\n")

    score := 0
    letToNum := map[string]int{"A": 0, "B": 1, "C": 2, "X": 0, "Y": 1, "Z": 2}
    for _, game := range games {
        letter := strings.Split(game, " ")
        player1 := letToNum[letter[0]]

        if letter[1] == "X" {
            score += 1 + (player1 + 2) % 3
        } else if letter[1] == "Z" {
            score += 7 + (player1 + 1) % 3
        } else {
            score += 4 + player1
        }
    }
    

    fmt.Println(score)
}
