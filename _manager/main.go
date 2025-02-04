package main

import (
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"strings"

	"github.com/pelletier/go-toml/v2"
)

// Config descriptor of
// track.toml file
type Config struct {
	Track map[string][]string `toml:"track"`
	Run   map[string][]string `toml:"run"`
}

// Convert Config struct into a
// list of parsed/formatted paths
func parseTracking(config Config) []string {
	var tracking []string
	for key := range config.Track {
		for _, value := range config.Track[key] {
			path := key

			// Turns      Into
			// ~/.config/ ~/.config
			// ~/         ~
			// /          /
			if strings.HasSuffix(path, "/") && len(path) > 1 {
				path = path[:len(path)-1]
			}

			// Turns      Into
			// ~/.config  $HOME/.config
			// ~/         $HOME
			if strings.HasPrefix(path, "~") {
				homeDir, err := os.UserHomeDir()
				if err != nil {
					log.Fatal("Unable to determine home directory\n", err)
				}
				path = homeDir + path[1:]
			}

			tracking = append(tracking, path+"/"+value)
		}
	}

	return tracking
}

// (> .___. )>
func main() {
	path, err := filepath.Abs("..")
	if err != nil {
		log.Fatal("Unable to get dotfiles directory\n", err)
	}

	file, err := os.ReadFile(filepath.Join(path, "track.toml"))
	if err != nil {
		log.Fatal("Unable to read track.toml\n", err)
	}

	var config Config
	err = toml.Unmarshal(file, &config)
	if err != nil {
		log.Fatal("Unable to parse TOML configuration\n", err)
	}

	tracking := parseTracking(config)
	if len(tracking) == 0 {
		log.Fatal("Not tracking anything!\n")
	}

	for _, value := range tracking {
		_, err := os.Stat(value)
		if err != nil {
			log.Printf("Unable to source tracked file %s, skipping...", value)
			continue
		}

		cmd := exec.Command("cp", value, path)
		err = cmd.Run()
		if err != nil {
			log.Fatalf("Unable to copy file/dir %s, exiting...", value)
		}
	}

	for _, value := range tracking {
		f, err := os.Stat(value)
		if err != nil {
			log.Fatal("Unable to determine if file/dir exists\n", err)
		}
		switch mode := f.Mode(); {
		case mode.IsDir():
			log.Printf("%s is a directory\n", value)
		case mode.IsRegular():
			log.Printf("%s is a regular file\n", value)
		}
	}
}
