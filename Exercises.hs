import Data.List (intercalate)

import qualified Answers

-- Data types
type Row a    = [a]
type Matrix a = [Row a]
type Digit    = Int
type Grid     = Matrix Digit

-- Printing function
p :: Grid -> IO()
p = putStrLn . unlines . map (intercalate " " . map show)

-- Some grids
grid1 :: Grid
grid1 = [[0, 2, 4, 0],
         [1, 0, 0, 3],
         [4, 0, 0, 2],
         [0, 1, 3, 0]]

grid2 :: Grid
grid2 = [[0, 3, 0, 1],
         [1, 0, 3, 2],
         [3, 0, 1, 0],
         [0, 1, 0, 3]]

-- Define grid size
boxSize = 2
gridSize = boxSize * boxSize

-- Exercise 1
-- Given: completions, valid
solve :: Grid -> [Grid]
solve = undefined

-- Exercise 2
-- Given: choices, expand
completions :: Grid -> [Grid]
completions = Answers.completions

-- Exercise 3
choices :: Grid -> Matrix [Digit]
choices = Answers.choices

-- Exercise 4
-- Given: cp
expand :: Matrix [Digit] -> [Grid]
expand = Answers.expand

-- Exercise 5
cp :: [[a]] -> [[a]]
cp = Answers.cp

-- Exercise 6
-- Given: nodups, rows, cols, boxs
valid :: Grid -> Bool
valid = Answers.valid

-- Exercise 7
nodups :: Eq a => [a] -> Bool
nodups = Answers.nodups

-- Exercise 8
rows :: Matrix a -> Matrix a
rows = Answers.rows

-- Exercise 9
cols :: Matrix a -> Matrix a
cols = Answers.cols

-- Exercise 10
-- Given: group, ungroup
boxs :: Matrix a -> Matrix a
boxs = Answers.boxs

-- Exercise 11
group :: [a] -> [[a]]
group = Answers.group

-- Exercise 12
ungroup :: [[a]] -> [a]
ungroup = Answers.ungroup
