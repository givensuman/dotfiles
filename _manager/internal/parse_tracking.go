package internal

import (
	"log"
	"os"
	"strings"
)

// Config descriptor of
// track.toml file
type Config struct {
	Track map[string][]string `toml:"track"`
	Run   map[string][]string `toml:"run"`
}

// Convert Config struct into a
// list of parsed/formatted paths
func ParseTracking(config Config) []string {
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
