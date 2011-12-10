#lang planet neil/sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x)
  (* x x))

(define (repeated f times)
  (define (repeat-iter next result times)
    (if (<= times 1)
        result
        (repeat-iter next (compose f next) (- times 1))))
  (repeat-iter f f times))

((repeated square 2) 5)
