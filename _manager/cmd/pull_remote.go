package cmd

import (
	"context"
	"errors"
	"log"
	"manager/internal"
	"os"
	"os/exec"
	"path/filepath"

	"github.com/pelletier/go-toml/v2"
	"github.com/urfave/cli/v3"
)

func PullRemote(ctx context.Context, command *cli.Command) error {
	path, err := filepath.Abs("..")
	if err != nil {
		return errors.New("unable to get dotfiles directory")
	}

	file, err := os.ReadFile(filepath.Join(path, "track.toml"))
	if err != nil {
		return errors.New("unable to read track.toml")
	}

	var config internal.Config
	err = toml.Unmarshal(file, &config)
	if err != nil {
		return errors.New("unable to parse TOML configuration in track.toml")
	}

	tracking := internal.ParseTracking(config)
	if len(tracking) == 0 {
		return nil
	}

	cmd := exec.Command("git", "pull")
	err = cmd.Run()
	if err != nil {
		return errors.New("unable to pull from remote")
	}

	for _, value := range tracking {
		_, err := os.Stat(value)
		if err != nil {
			log.Printf("Tracked file/dir %s not present locally, skipping...\n", value)
			continue
		}

		cmd := exec.Command("cp", "-rf", path, value)
		err = cmd.Run()
		if err != nil {
			log.Printf("Unable to copy tracked file/dir %s, skipping...\n", value)
		}
	}

	return nil
}
