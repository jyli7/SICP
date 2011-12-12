#lang planet neil/sicp

(define (make-interval a b) 
  (cons a b))

(define (lower-bound y)
  (car y))

(define (upper-bound y)
  (cdr y))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (let ((p1 (- (lower-bound x) (lower-bound y)))
        (p2 (- (upper-bound x) (upper-bound y))))
  (make-interval (min p1 p2)
                 (max p1 p2))))
