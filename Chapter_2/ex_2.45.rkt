#lang planet neil/sicp

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))
    
(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

;split
(define (split outer inner)
  (if (= n 0)
      painter
      (let ((smaller (split painter (- n 1))))
        (outer painter (inner smaller smaller)))))

;tests
(define right-split (split beside below))
(define up-split (split below beside))
   
        