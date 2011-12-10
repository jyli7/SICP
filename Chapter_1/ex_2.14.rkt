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

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (perc i)
  (/ (width i)
     (center i)))

;takes a center and a perc and produces the desired interval
(define (make-center-percent c perc)
  (make-interval (- c (* c perc)) (+ c (* c perc))))

;Lem's functions

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

;(par1 (make-center-percent 10 .01) (make-center-percent 20 .02))
;(par2 (make-center-percent 10 .01) (make-center-percent 20 .02))

(make-interval 3 5)
(center (par1 (make-center-percent 10 .01) (make-center-percent 20 .02)))
(center (par2 (make-center-percent 10 .01) (make-center-percent 20 .02)))

(perc (par1 (make-center-percent 10 .01) (make-center-percent 20 .02)))
(perc (par2 (make-center-percent 10 .01) (make-center-percent 20 .02)))