#lang planet neil/sicp

;Exercise 2.24. Suppose we evaluate the expression (list 1 (list 2 (list 3 4))). Give the
;result printed by the interpreter, the corresponding box-and-pointer structure, and the interpretation of this
;as a tree (as in figure 2.6).

;ANSWER PART 1: Result as printed by interpreter:
;(1 (2 (3 4)))

;Test this:
(display (list 1 (list 2 (list 3 4))))

;ANSWER PART 2: Corresponding box and pointer structure:
