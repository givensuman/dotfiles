package main

import (
	"context"
	"fmt"
	"manager/cmd"
	"os"

	"github.com/urfave/cli/v3"
)

func main() {
	cmd := &cli.Command{
		Name:        "manager",
		Description: "just a dotfiles manager",
		UsageText:   "manager pull local/remote",

		Commands: []*cli.Command{
			{
				Name:        "pull",
				Description: "source dotfiles from somewhere",

				Commands: []*cli.Command{
					{
						Name:        "local",
						Description: "source dotfiles from local machine",
						Action:      cmd.PullLocal,
					},
				},
			},
		},
	}

	err := cmd.Run(context.Background(), os.Args)
	if err != nil {
		fmt.Println(err.Error())
		fmt.Println("try 'manager help' for more information")
		os.Exit(1)
	}
}
