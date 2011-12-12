#lang planet neil/sicp

;Lesson of this problem: These three methods are subtletly different!

(define x (list 1 2 3))
(define y (list 4 5 6))

;What result is printed in response to the following?

;(append x y)
;=> my answer: (1 2 3 4 5 6)

(display (append x y))

;(cons x y)
;=> my answer: ((1 2 3) 4 5 6)
(newline)

(display (cons x y))

;(list x y)
;=> my answer: ((1 2 3) (4 5 6))

(display (list x y))