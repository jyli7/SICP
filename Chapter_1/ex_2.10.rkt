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

(define (modified-div-interval x y)
  (cond ((= (upper-bound y) 0) (display "divide by 0 error"))
        ((= (lower-bound y) 0) (display "divide by 0 error"))
        (mul-interval x
                      (make-interval (/ 1.0 (upper-bound y))
                                     (/ 1.0 (lower-bound y))))))

(modified-div-interval (make-interval 4 8) (make-interval 0 5))
