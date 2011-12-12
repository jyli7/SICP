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

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

;new stuff begins below

(define (interval-width x)
  (/ (- (upper-bound x) (lower-bound x)) 2))

(interval-width (make-interval 4 8))

;width of the sum of two intervals is entirely a function of the width of each interval

;width of interval 1 is 1, interval 2 is 4. Width of added interval is 5. 
(interval-width (add-interval (make-interval 3 5) (make-interval 2 10)))

;width of interval 1 is 1, interval 2 is 4. Width of multiplied interval is 22. Function of not just width, but lower bound
;and upper bound of factors
(interval-width (mul-interval (make-interval 3 5) (make-interval 2 10)))