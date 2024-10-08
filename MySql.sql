CREATE DATABASE adventure_db;

USE adventure_db;

-- Creating the story_nodes table
CREATE TABLE story_nodes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL
);

-- Creating the choices table
CREATE TABLE choices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    story_node_id INT NOT NULL,
    choice_text VARCHAR(255) NOT NULL,
    next_node_id INT,
    FOREIGN KEY (story_node_id) REFERENCES story_nodes(id),
    FOREIGN KEY (next_node_id) REFERENCES story_nodes(id)
);

-- Inserting story nodes
-- Insert story segments into the story_nodes table
INSERT INTO story_nodes (title, content) VALUES
('The Forgotten Town', 'You find yourself standing at the edge of a forgotten town, enveloped in an eerie fog. The air is thick with a sense of unease, and distant whispers echo through the streets. A flickering lantern in the distance beckons you closer.'),
('The Lantern Keeper', 'As you approach the lantern, you discover an old man hunched over it. His eyes glint with a strange light, and he smiles cryptically. "Ah, a curious traveler! Will you share your story?"'),
('The Path to Nowhere', 'You decide to turn back, but the fog thickens, and the town seems to shift around you. Suddenly, you find yourself on a narrow path leading deeper into the woods, where shadows dance among the trees.'),
('The Dark Alleyway', 'You venture into the dark alleyway, where you find strange symbols etched into the walls. A chilling wind brushes past you, carrying faint whispers. You feel a presence behind you.'),
('The Story Unfolds', 'If you choose to share your story with the lantern keeper, he listens intently. "Every traveler has a purpose," he says, revealing a hidden truth about the town. "It holds a secret that has been lost for centuries."'),
('The Town’s Secret', 'The lantern keeper smiles knowingly. "The town was cursed by a betrayal long ago. Those who linger too long are drawn into its shadows." Suddenly, he hands you a map with mysterious markings.'),
('The Shadows Among Us', 'If you choose to follow the path deeper into the woods, the shadows begin to coalesce into forms. You realize you are not alone. They whisper your name and beckon you to join them.'),
('The Confrontation', 'In the alleyway, when you turn around, you find a figure cloaked in darkness, their face obscured. "Why do you disturb the secrets of this town?" they ask, their voice echoing like a distant thunder.'),
('The Revelation', 'If you investigate the symbols in the alleyway, they seem to tell a story of the town''s downfall—a tale of betrayal and loss. A figure emerges from the shadows, revealing themselves to be a ghostly guardian of the town.'),
('The Choice of Fates', 'As you uncover the secrets of the town, you face a choice that could change everything. Will you attempt to break the curse, freeing the town from its haunting past, or will you embrace the shadows, becoming a part of the legend?');

-- Inserting choices into the choices table
-- Choices for 'The Forgotten Town' (id = 1)
INSERT INTO choices (story_node_id, choice_text, next_node_id) VALUES
(1, 'Approach the lantern.', 2),
(1, 'Turn back and leave the town.', 3),
(1, 'Explore the alleyway to your right.', 4);

-- Choices for 'The Lantern Keeper' (id = 2)
INSERT INTO choices (story_node_id, choice_text, next_node_id) VALUES
(2, 'Tell him about your journey.', 5),
(2, 'Ask him about the town.', 6),
(2, 'Ignore him and inspect the lantern.', 7);

-- Choices for 'The Path to Nowhere' (id = 3)
INSERT INTO choices (story_node_id, choice_text, next_node_id) VALUES
(3, 'Follow the path deeper into the woods.', 8),
(3, 'Try to find your way back to the town.', 1),
(3, 'Call out to see if anyone else is nearby.', 1);

-- Choices for 'The Dark Alleyway' (id = 4)
INSERT INTO choices (story_node_id, choice_text, next_node_id) VALUES
(4, 'Investigate the symbols.', 9),
(4, 'Turn around to confront the presence.', 10),
(4, 'Run back to the main street.', 1);

-- Choices for 'The Story Unfolds' (id = 5)
INSERT INTO choices (story_node_id, choice_text, next_node_id) VALUES
(5, 'Ask him to reveal the secret.', 6),
(5, 'Thank him and leave.', 1),
(5, 'Inquire about the townspeople.', 1);

-- Choices for 'The Town’s Secret' (id = 6)
INSERT INTO choices (story_node_id, choice_text, next_node_id) VALUES
(6, 'Examine the map closely.', 1),
(6, 'Ask him how to break the curse.', 1),
(6, 'Refuse the map and leave.', 1);

-- Choices for 'The Shadows Among Us' (id = 7)
INSERT INTO choices (story_node_id, choice_text, next_node_id) VALUES
(7, 'Join the shadows.', 1),
(7, 'Fight against their pull.', 1),
(7, 'Try to communicate with them.', 1);

-- Choices for 'The Confrontation' (id = 8)
INSERT INTO choices (story_node_id, choice_text, next_node_id) VALUES
(8, 'Demand to know who they are.', 1),
(8, 'Apologize and back away.', 1),
(8, 'Ask about the symbols on the wall.', 1);

-- Choices for 'The Revelation' (id = 9)
INSERT INTO choices (story_node_id, choice_text, next_node_id) VALUES
(9, 'Ask the guardian for help.', 1),
(9, 'Demand to know why they are bound to the town.', 1),
(9, 'Try to break the symbols apart.', 1);

-- Choices for 'The Choice of Fates' (id = 10)
INSERT INTO choices (story_node_id, choice_text, next_node_id) VALUES
(10, 'Break the curse and restore the town.', 1),
(10, 'Embrace the shadows and become their leader.', 1),
(10, 'Leave the town and never return.', 1);
