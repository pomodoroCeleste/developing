// scrivere un programma che legga da tastiera un valore n 
// e stampi a video un triangolo di n base e altezza usando 
// il carattere '*'.

package main

import "fmt" 

func main() {

	var n int
	fmt.Print("Inserisci n: ")
	fmt.Scan(&n)
	for i := 1; i <= n; i++ {
		for j := 1; j <= i; j++ {
			fmt.Print("*")
		}
		fmt.Println()
	}
}