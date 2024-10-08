package main

import (
	"log"
)

// Story struct to represent a story segment
type Story struct {
	ID      int
	Content string
}

// Choice struct for user choices
type Choice struct {
	ID          int
	StoryID     int
	ChoiceText  string
	NextStoryID int
}

// GetStartingStory fetches the starting story from the database
func GetStartingStory() Story {
	var story Story
	query := "SELECT id, content FROM story_nodes WHERE id = 1 LIMIT 1" // Adjusted to fetch starting story
	err := db.QueryRow(query).Scan(&story.ID, &story.Content)
	if err != nil {
		log.Fatal(err)
	}
	return story
}

// GetChoices fetches all choices for a given story
func GetChoices(storyID int) []Choice {
	var choices []Choice
	query := "SELECT id, choice_text, next_node_id FROM choices WHERE story_node_id = ?"
	rows, err := db.Query(query, storyID)
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	for rows.Next() {
		var choice Choice
		err := rows.Scan(&choice.ID, &choice.ChoiceText, &choice.NextStoryID)
		if err != nil {
			log.Fatal(err)
		}
		choices = append(choices, choice)
	}

	return choices
}

// GetStoryByID fetches a specific story by its ID
func GetStoryByID(storyID int) Story {
	var story Story
	query := "SELECT id, content FROM story_nodes WHERE id = ?"
	err := db.QueryRow(query, storyID).Scan(&story.ID, &story.Content)
	if err != nil {
		log.Fatal(err)
	}
	return story
}
