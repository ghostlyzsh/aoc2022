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
    for _, game := range games {
        letter := strings.Split(game, " ")
        player1 := 0
        player2 := 0
        if letter[0] == "A" {
            player1 = 0
        } else if letter[0] == "B" {
            player1 = 1
        } else {
            player1 = 2
        }
        if letter[1] == "X" {
            player2 = (player1 + 2) % 3
        } else if letter[1] == "Y" {
            player2 = player1
        } else {
            player2 = (player1 + 1) % 3
        }

        fmt.Println(player1, player2)
        if (player2 + 1) % 3 == player1 {
            score += 1 + player2
        } else if (player2 + 2) % 3 == player1 {
            score += 7 + player2
        } else {
            score += 4 + player2
        }
    }
    

    fmt.Println(score)
}
