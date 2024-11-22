// scrivere un programma che:
// - legga da input una sequenza di stringhe senza spazi, una per linea
// - la lettura termina quando viene letta una stringa vuota "" e viene stampata
//   la concatenazione delle stringhe lette, intervallate da un carattere spazio.

package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    var result string

    for {
        fmt.Print("Inserisci una stringa: ")
        scanner.Scan()
        s := scanner.Text()
        if s == "" {
            break
        }
        result += s + " "
    }

    fmt.Println(result)
}