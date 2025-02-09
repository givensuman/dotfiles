package cmd

import (
	"log"
	"manager/internal"
	"os"
	"os/exec"
	"path/filepath"

	"github.com/pelletier/go-toml/v2"
)

func PullLocal() {
	path, err := filepath.Abs("..")
	if err != nil {
		log.Fatal("Unable to get dotfiles directory\n", err)
	}

	file, err := os.ReadFile(filepath.Join(path, "track.toml"))
	if err != nil {
		log.Fatal("Unable to read track.toml\n", err)
	}

	var config internal.Config
	err = toml.Unmarshal(file, &config)
	if err != nil {
		log.Fatal("Unable to parse TOML configuration\n", err)
	}

	tracking := internal.ParseTracking(config)
	if len(tracking) == 0 {
		log.Fatal("Not tracking anything!\n")
	}

	for _, value := range tracking {
		_, err := os.Stat(value)
		if err != nil {
			log.Printf("Unable to source tracked file/dir %s, skipping...", value)
			continue
		}

		cmd := exec.Command("cp", "-rf", value, path)
		err = cmd.Run()
		if err != nil {
			log.Printf("Unable to copy tracked file/dir %s, skipping...", value)
		}
	}
}
