extends Node

# Reddit post talking about how CC stores its score values:
# https://www.reddit.com/r/CookieClicker/comments/b2kxo9/how_does_cookie_clicker_store_numbers/
var score = 500

# HELPER COUNTS GO HERE
# Helper score and cost values (as well as future upgrade plan) shown here: 
# https://cookieclicker.fandom.com/wiki/Building#Building_Prices
var fisher_count = 0
var fisher_worker_price = 15
var fisher_sps = 0.15

var logi_runner_count = 0
var logi_runner_worker_price = 100
var logi_runner_sps = 1
var logi_map_truck_marker_x
var logi_map_door_marker_x


# FISHING MINIGAME VARS
var spawned_fish_rarity = 0
var caught_fish_array = []
var fish_just_caught_no_collisions = false
var collided_with_fish_going_down = false
var collided_with_fish_going_up = false
