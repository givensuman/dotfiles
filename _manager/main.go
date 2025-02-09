package main

import (
	"log"
	"manager/cmd"
	"os"
)

// Commands accepted by the CLI
type Command struct {
	Name    string
	Aliases []string
	Command func()
}

var cli = []Command{
	{
		Name:    "pull local",
		Aliases: []string{"pl", "pull-local", "pulllocal"},
		Command: cmd.PullLocal,
	},
	{
		Name:    "pull remote",
		Aliases: []string{"pr", "pull-remote", "pullremote"},
		Command: func() { println("TODO") },
	},
}

func parseCommand(args []string) (func(), error) {
	for _, command := range cli {
		1
	}
}

func main() {
	run, err := parseCommand(os.Args[1:])
	if err != nil {
		log.Fatal(err)
	}

	println(run)
}
