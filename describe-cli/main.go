package main
	import(
		"fmt"
		"github.com/spf13/pflag"
	)
  var helpFlag bool
  var fooFlag string
  var barFlag string

	func main() {
		pflag.BoolVarP(&helpFlag, "help", "p", false, "show help message")
		pflag.StringVar(&fooFlag, "foo", "defoo", "help message foo")
		pflag.StringVarP(&barFlag, "bar", "b", "debar", "help message bar")
	  pflag.Parse()

    if helpFlag {
      pflag.PrintDefaults()
      return
    }

    fmt.Println(fooFlag, barFlag)
}

