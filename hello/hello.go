package main

import (
	"fmt"

	"github.com/tatsuyayamauchi/golang-test/hello/subpkg1"
)

func main() {
	fmt.Println("hello world")
	subpkg1.Hoge()
}
