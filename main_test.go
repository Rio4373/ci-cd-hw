package main

import (
    "testing"
    "strings"
)

func TestMain(t *testing.T) {
    expected := "Работает!?"
    got := strings.TrimSpace(fmt.Sprintf("Работает!?"))

    if got != expected {
        t.Errorf("Expected %s, but got %s", expected, got)
    }
}
