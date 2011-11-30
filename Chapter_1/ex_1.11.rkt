#lang racket

;By recursive
(define (f n)
  (cond ((< n 3) n)
        ((>= n 3) (+ (f (- n 1))
                     (* 2 (f (- n 2)))
                     (* 3 (f (- n 3)))
                     )
                  )
        )
  )

(f 4)
(f 5)

;By iterative
(define (g n)
  (g-iter 4 2 1 n)
  )

(define (g-iter c b a count)
  (cond ((= count 0) 0)
        ((= count 1) a)
        ((= count 2) b)
        ((= count 3) c)
        
        (else (g-iter (+ c (* 2 b) (* 3 a)) c b (- count 1))
              )
        )
  )

(g 4)

;notice that 
;n, g(n) are...
;0, 0
;1, 1
;2, 2
;3, 4

