import Data.List (intercalate)

import qualified Answers

-- Data types
type Row a    = [a]
type Matrix a = [Row a]
type Digit    = Int
type Grid     = Matrix Digit

-- Printing functions
p :: Grid -> IO ()
p = putStrLn . unlines . map (intercalate " " . map show)

ps :: [Grid] -> IO [()]
ps = sequence . map p

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
solve = filter valid . completions

-- Exercise 2
-- Given: choices, expand
completions :: Grid -> [Grid]
completions = expand . choices

-- Exercise 3
choices :: Grid -> Matrix [Digit]
choices = map $ map choice

choice :: Digit -> [Digit]
choice 0 = [1..gridSize]
choice n = [n]

-- Exercise 4
-- Given: cp
expand :: Matrix [Digit] -> [Grid]
expand = cp . map cp

-- Exercise 5
cp :: [[a]] -> [[a]]
cp = foldr (flip cp2) [[]]

cp2 :: [[a]] -> [a] -> [[a]]
cp2 xss ys = concat $ map (\x -> map (x:) xss) ys

-- Exercise 6
-- Given: nodups, rows, cols, boxs
valid :: Grid -> Bool
valid g = all (valid' g) [rows, cols, boxs]
  --valid' rows g && valid' cols g && valid' boxs g
  --(and $ map nodups (rows g)) && (and $ map nodups (cols g)) && (and $ map nodups (boxs g))

valid' :: Grid -> (Grid -> Grid) -> Bool
valid' g f  = all nodups (f g)

-- Exercise 7
nodups :: Eq a => [a] -> Bool
nodups [] = True
nodups (x : xs) = notElem x xs && nodups xs

-- Exercise 8
rows :: Matrix a -> Matrix a
rows = id

-- Exercise 9
cols :: Matrix a -> Matrix a
cols ([] : _) = []
cols matrix =
  map head matrix : cols (map tail matrix)
-- cols [xs]     = map pure xs
-- cols (xs:xss) = zipWith (:) xs (cols xss)

-- Exercise 10
-- Given: group, ungroup
boxs :: Matrix a -> Matrix a
boxs = map ungroup . ungroup . map cols . group . map group

-- Exercise 11
group :: [a] -> [[a]]
group [] = []
group xs = take boxSize xs : group (drop boxSize xs)

-- Exercise 12
ungroup :: [[a]] -> [a]
ungroup = concat
