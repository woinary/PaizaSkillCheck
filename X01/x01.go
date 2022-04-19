package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	sc := bufio.NewScanner(os.Stdin)
	sc.Scan()

	num_unit, _ := strconv.Atoi(sc.Text())
	unit_length := num_unit * 25
	fmt.Println(unit_length)
}
