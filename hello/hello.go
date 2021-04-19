package main

import (
	"github.com/tatsuyayamauchi/golang-test/subpkg1"
	"fmt"
)

func main() {
	fmt.Println("hello world")
	subpkg1.Hoge()
}
