Implement [Conway's Game of Life] (https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)

Rules:
* Any live cell with fewer than two live neighbours dies, as if caused by under-population.
* Any live cell with two or three live neighbours lives on to the next generation.
* Any live cell with more than three live neighbours dies, as if by overcrowding.
* Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

TODO (not in priority order):
* move more logic out of bin/go
* completely restructure Grid to do array math to improve performance from n^2 to something saner
* print every generation as it is generated instead of generating them all and then printing?
* reduce duplication in calling cell.live_neighbors
* implement State.random better (or make it generate seeds smarter than randomly?)
* Implement hexagonal Game of Life     (rules at http://www.well.com/~dgb/hexrules.html and below)
* Implement display in openGL or something other than terminal

* -|--|--| 2|--|--|-
* --| 2| 1| 1| 2|--|
* -|--| 1| *| 1|--|-
* --| 2| 1| 1| 2|--|
* -|--|--| 2|--|--|-

The rules that govern the behavior of each cell or space in HexLife take into account the cell/space's 12 nearest neighbors.
In the illustration above, the nearest neighbors of the space marked by "*"  are the numbered spaces.
There are six '1st tier neighbors', denoted by "1", and six '2nd tier neighbors', denoted by "2".
As in Conway's Life, whether a cell is born, dies, or survives to the next generation is determined by how many of these 12 neighboring spaces contain live cells.
Each generation the number of live neighbors of each space are added up. However, live 2nd tier neighbors are only weighted as 0.3 in this sum whereas live 1st tier neighbors are weighted as 1.0.
A cell is born into an empty space if this sum falls within the range of 2.3 - 2.9. Otherwise the space remains empty.
A live cell survives to the next generation if this sum falls within the range of 2.0 - 3.3. Otherwise it dies (becomes an empty space).

* * means occupied, so A is not occupied, but C is occupied

* --|--|--|--|--|--|
* -|--|--|--|--|--|-
* --| A| *|*C|--|--|
* -|--|*B| *|--|--|-
* --| *|--|*D|--|--|
* -|--|--|--|--|--|-

This illustration shows a simple pattern of live cells (green circles).
The sum of live neighbors for space "A" is 2.6 (2 1st tier neighbors x 1.0 plus 2 2nd tier neighbors x 0.3 = 2.0 + 0.6 = 2.6).
In the next generation there will a new cell in this space. The sum for cell "B" is 3.6.
This cell will die from overcrowding. Cell "C" will survive to the next generation as its sum is 2.6.
Cell "D" will die, on the other hand, since its sum is only 1.6.