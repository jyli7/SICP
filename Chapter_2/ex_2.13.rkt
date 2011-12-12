#lang planet neil/sicp

;Exercise 2.13. Show that under the assumption of small percentage tolerances there is a simple formula
;for the approximate percentage tolerance of the product of two intervals in terms of the tolerances of the
;factors. You may simplify the problem by assuming that all numbers are positive.

;Suppose we have two intervals:
;INT 1 => (10, .1)
;INT 2 => (20, .05)

;INT 1*2 => (9*19 11*21)
;        => (171 231)
;        => (201, .149)

;Guess: percentage tolerance of product is equal to PRODUCT of percentage tolerance of the factors

;INT 1 => (c, x)
;INT 2 => (d, y)
;INT 3 => ((c-cx)*(d-dy) (c+cx)*(d-dy))
;      => ((cd - cdy - cdx + cdxy) (cd - cdy + cdx - cdxy))
;      => (center: (cd - cdy), perc: ((2cdx - 2cdxy) / (cd - cdy))
;      => (center: cd(1 - y), perc: (2cdx(1 - y) / cd(1 - y))
;      => (center: cd(1 - y), perc: (x)