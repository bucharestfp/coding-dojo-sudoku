module Answers where

type Matrix a = [Row a]
type Row a = [a]
type Grid = Matrix Digit
type Digit = Int

boxSize = 2
gridSize = boxSize * boxSize

solve :: Grid -> [Grid]
solve = filter valid . completions

completions :: Grid -> [Grid]
completions = expand . choices

choices :: Grid -> Matrix [Digit]
choices = map (map choice)
    where
        choice 0 = [1..gridSize]
        choice i = [i]

expand :: Matrix [Digit] -> [Grid]
expand = cp . map cp

cp :: [[a]] -> [[a]]
cp []       = [[]]
cp (xs:xss) = [x:ys | x <- xs, ys <- cp xss]

valid :: Grid -> Bool
valid grid = valid' rows && valid' cols && valid' boxs
    where valid' f = all nodups (f grid)

nodups :: Eq a => [a] -> Bool
nodups []     = True
nodups (x:xs) = (not $ elem x xs) && nodups xs

rows :: Matrix a -> Matrix a
rows = id

cols :: Matrix a -> Matrix a
cols [xs]     = [[x] | x <- xs]
cols (xs:xss) = zipWith (:) xs (cols xss)

boxs :: Matrix a -> Matrix a
boxs = map ungroup . ungroup . map cols . group . map group

group :: [a] -> [[a]]
group [] = []
group xs = hd:group tl
    where (hd, tl) = splitAt boxSize xs

ungroup :: [[a]] -> [a]
ungroup = concat
