package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.ListenAndServe(":8000", nil)
	fmt.Println("Serving scores on localhost:8000")
}
