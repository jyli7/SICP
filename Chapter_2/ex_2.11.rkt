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

;new stuff begins below

(define (modified-mul-interval x y)
  (if (and (< (lower-bound x) 0) (< (lower-bound y) 0))
      (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
        (make-interval (min p1 p2 p3 p4)
                       (max p1 p2 p3 p4)))
      (make-interval (* (lower-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y)))))

(modified-mul-interval (make-interval 3 4) (make-interval 8 2))
