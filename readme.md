

Fix the fucking tilemap: 
	- adjust margin,size1 without changing all 
	- the sprite didn't split correctly (i tried 14-18px)
	-> how to fix this?


I dont know how OOP works in gdscript: 
	- calling super is error 
	- extends script_name => error 
	- export variable in parent disappear in child 

TRAJECTORY :) 
	- MUST SET TEST BODY collision size = REAL BULLET 
	- that costs me 3 hours

WANDERING: 
	- time-out, pick a point in zone 
	- wander state: move toward that point, end wandering when distance to that point is < TOLERANCE

	
COLLISIONS: 
	- detect empty space => lots of recursion
	-> collision is used async :) 


SPAWN ALGO: 
	- spot empty spots using physics process :) and use a spawnable:boolean to indicate spawn
	
	
	
# Sources 

assets: 
	- https://0x72.itch.io/dungeontileset-ii
