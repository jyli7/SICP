#lang racket

;(A 1 10) = 2^10
;(A 2 4) = 2^16
;(A 3 3) = 2^27

;(f n) computes 2n
;(g n) computes 2^n
;(h n) computes 2^(2^n)

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
;(A 1 10)
;(A 0 (A 1 9))
;(* 2 (A 1 9))
;(* 2 (A 0 (A 1 8)))
;(* 2 (* 2 (A 1 8)))
;2*10 = 1024


(A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 A(2 2)))
(A 1 (A 1 A(1 A(2 1))))
(A 1 (A 1 A(1 2)))
(A 1 (A 1 A(0 A(1 1))))
(A 1 (A 1 A(0 2)))
(A 1 (A 1 (*2 2)))
(A 1 (A 1 4))
(A 1 (A 0 A(1 3)))
(A 1 (A 0 A(0 A(1 2))))
(A 1 (A 0 A(0 A(0 A(1 1)))))
(A 1 (A 0 A(0 A(0 2))))
(A 1 (A 0 A(0 (* 2 2))))
(A 1 (A 0 (* 2 4)))
(A 1 (A 0 8))
(A 1 (*2 8))
(A 1 16)
(A 0 A(1 15))