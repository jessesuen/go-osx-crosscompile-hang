package main

import (
	"log"
	"net/http"
	"time"
)

func main() {
	start := time.Now()
	http.Get("https://google.com")
	log.Printf("Elapsed: %v", time.Since(start))
}
