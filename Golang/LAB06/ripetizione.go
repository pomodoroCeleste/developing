// scrivere un programma che:
// - legga da input un numero intero n e una stringa senza spazi
// - stampi a video la stringa ripetuta n volte, intervallando le
//   n occorrenze della stringa con il carattere meno '-'

package main

import ("fmt")

func main() {
	var n int
	var s string
	fmt.Print("Inserisci n: ")
	fmt.Scan(&n)
	fmt.Print("Inserisci una stringa: ")
	fmt.Scan(&s)

	for i := 1; i <= n; i++ {
		fmt.Print(s)
		if i != n {
			fmt.Print("-")
		}
	}
	fmt.Println()
}