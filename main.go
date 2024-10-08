package main

import (
	"fmt"
)

const (
	// ANSI escape codes for text formatting
	reset     = "\033[0m"
	bold      = "\033[1m"
	italic    = "\033[3m"
	underline = "\033[4m"
	green     = "\033[32m"
	yellow    = "\033[33m"
	red       = "\033[31m"
)

// Main function
func main() {
	// Establish connection to the database
	ConnectDB()

	// Get the starting story
	startingStory := GetStartingStory()

	// Start playing the story
	PlayStory(startingStory)
}

// PlayStory displays the story content and presents the available choices
func PlayStory(story Story) {
	// Print the story content with formatting
	fmt.Println(italic + story.Content + reset)

	// Fetch choices for the current story
	choices := GetChoices(story.ID)

	// Check if the story has no more choices (end of the story)
	if len(choices) == 0 {
		fmt.Println(green + "The story ends here." + reset)
		return
	}

	// Display the available choices
	fmt.Println("\nWhat will you do next?")
	for i, choice := range choices {
		fmt.Printf("%s%d: %s%s\n", bold, i+1, choice.ChoiceText, reset)
	}

	// Take user input for their choice
	var userChoice int
	fmt.Scan(&userChoice)

	// Validate the choice and proceed to the next story
	if userChoice > 0 && userChoice <= len(choices) {
		nextStory := GetStoryByID(choices[userChoice-1].NextStoryID)
		PlayStory(nextStory)
	} else {
		fmt.Println(red + "Invalid choice, try again." + reset)
		PlayStory(story)
	}
}
