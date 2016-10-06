package main

import (
	"io"
	"log"
	"net/http"
)

func plaintextResponse(w http.ResponseWriter, body string) {
	w.Header().Add("Content-Type", "text/plain")
	io.WriteString(w, body)
}

func main() {
	http.HandleFunc("/", func (w http.ResponseWriter, r *http.Request) {
		plaintextResponse(w, "Hello, World!")
	})
	http.HandleFunc("/health", func (w http.ResponseWriter, r *http.Request) {
		plaintextResponse(w, "OK")
	})
	log.Fatal(http.ListenAndServe(":9090", nil))
}
