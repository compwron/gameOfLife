Implement https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life

Samples: https://www.ruby-forum.com/topic/179235

Rules:
Any live cell with fewer than two live neighbours dies, as if caused by under-population.
Any live cell with two or three live neighbours lives on to the next generation.
Any live cell with more than three live neighbours dies, as if by overcrowding.
Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

parse seed from file(?)
display always-moving in ruby


Fibers - concurrency http://www.ruby-doc.org/core-2.0/Fiber.html

https://github.com/andersondias/conway-game-of-life-ruby
https://github.com/spaghetticode/game-of-life-ruby
https://github.com/ofcan/game-of-life-ruby
https://github.com/Gonzih/game-of-life-ruby
https://github.com/JoshCheek/Conway-s-Game-of-Life
https://github.com/5v3n/Conways-Game-Of-LIFE

http://bjorkoy.com/2010/05/conways-game-of-life-in-ruby/

def play! (1..@steps).each do next! system('clear') puts self end end

