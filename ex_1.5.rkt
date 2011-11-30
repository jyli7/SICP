#lang racket

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y
      )
  )

(test 0 (p))

;; if normal
(if (= 0 0)
    0
    (p)
    )

(if (= 0 0)
    0
    p 
    )

0 

;; if applicative
(if (= 0 0)
    0 
    p
    )
