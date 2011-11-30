#lang racket
(define (f n)
  (cond ((< n 3) n )
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))
                 )
              )
        )
  )

(f 4)
 
(define (g n)
  (cond ((< n 3) n)
        (else (g-iter 0 1 2 4 (- n 3))
        ))
  )

(define (g-iter three-back two-back one-back current count)
  (if (= count 0)
      current
      (g-iter two-back one-back current (+ (* 3 two-back) (* 2 one-back) (current)) (- count 1))
      )
  )

(g 4)