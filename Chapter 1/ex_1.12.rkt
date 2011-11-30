#lang racket

;Pascal's triangle
;Top point is x=0, y=0

(define (pt x y)
  (cond ((= x 0) 1)
        ((= x y) 1)
        (else (+ (pt (- x 1) (- y 1)) 
                 (pt x (- y 1))
                 )
              )
        )
  )

(pt 2 4)
(pt 3 5)
  