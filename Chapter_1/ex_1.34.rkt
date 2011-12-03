#lang planet neil/sicp

(define (f g)
  (g 2))

(define (square n)
  (* n n))

;Then we have
(f square)
;4
(f (lambda (z) (* z (+ z 1))))
;6

;What happens if we (f f)?

(f f)

;Throws up an error because (2 2) is meaningless. 


