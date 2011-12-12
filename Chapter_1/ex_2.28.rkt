#lang planet neil/sicp

(pair? (list 2 3))
(pair? 2)
(pair? (list 1 2 3))

(define (fringe l)
  (cond ((null? l) nil)
        ((not (pair? (car l))) (append (list (car l)) (fringe (cdr l))))
        (else (append (fringe (car l)) (fringe (cdr l))))))


;(display (fringe (list (list 1 2 3) 4)))

(define x (list (list 1 2) (list 3 4)))
;(display (fringe x))
;(display (fringe (list x x)))


