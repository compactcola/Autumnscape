# Autumnscape

All assets used are made by me for various other projects, including all tilemaps, animations, and sprites. Code was largely self written or borrowed from my previous game.

### Setting up tilemaps, basic player movement and animations, and collision - 1.5 hours
This didn't take too long as I'm using my own assets from previous projects. I also ended up just using the basic CharacterBody2D movement script, but hooking it up properly to the animations did take most of this time.

### Drawing and planning level - 30 mins
Just did some bad sketches of the general layout of level I wanted. Also decided I want it to be a "tutorial" level, where the player gets a feel for the most basic movement mechanics and level hazards.

### Implementing level mechanics (spikes, moving platforms) - about 1 hour
The main things I added here for the level to make sense were spikes and moving platforms, both of which were pretty easy to set up and implement. I also added a checkpoint and chest at the end of the level. They don't currently do anything since that's not in the scope of this project, but the bulk of the time I took here was getting all the animations to work properly for them.

### Painting and making level in Godot - 3+ hours. 
Specifically, the tileset I was using took a lot of time to make sure everything lined up and looked good. Also the moving platforms are annoying to implement as I had to make a specific animation within the animation player for every single one based off of where it was located and would be moving to.

### Playtesting and polish
Since this project is mostly about the level design I didn't spend too long adding polish or juice aside from the sprites I already had. I did have my girlfriend playtest the level. Ideally in a real game I would have a better and larger group of people, but it was still helpful and led to some changes around the level as well as player movement acceleration since she kept walking off the cliffs accidentally.

### UI/UX Wireframe - 30 mins
This didn't take too long as my game has very little need for UI elements, so I just implemented the basic ones

### Implementing basic Menus and Pause Screen - 4 hours
Without exaggeration this was kind of a nightmare. I haven't done a lot with Godot UI elements but the little I have done I have NOT enjoyed, and this project was not an exception unfortunately. Implementing them wasn't as big of an issue as nailing down the dozens of bugs they caused, ways they didn't work, and tweaking and adjusting them to feel a little professional at least. They still look bad tho.

### Implementing the keybinding feature - 2 hours
Followed this tutorial: https://www.youtube.com/watch?v=of9O44xr0Go
Following the tutorial didn't take long, but it took ages to get it to even kind of work for my game. In the end it only rebinds the jump key, for some reason, but it does at least kind of work! No controller functionality but as a proof of concept I am glad it is in the game. 
