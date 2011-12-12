#lang planet neil/sicp

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

;takes a center and a perc and produces the desired interval
(define (make-center-percent c perc)
  (make-interval (- c (* c perc)) (+ c (* c perc))))

(define (perc i)
  (/ (/ (- (upper-bound i) (lower-bound i)) 2)
     (center i)))
  