#lang planet neil/sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x)
  (* x x))

(define (repeated f times)
  (lambda (x)
    (if (= times 1)
        (f x)
        ((compose f (repeated f (- times 1))) x))))

((repeated square 2) 5)