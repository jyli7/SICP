#lang planet neil/sicp

;make an accumulator generator

(define (make-accumulator initial)
  (define (add amount)
    (begin (set! initial (+ initial amount))
           initial))
  add)

(define A (make-accumulator 5))

(A 10)
(A 10)


         