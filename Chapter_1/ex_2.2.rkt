#lang planet neil/sicp

(display (list 1 2 3 4))

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point (make-point 3 4))

(define (average-two x y)
  (/ (+ x y) 2))

(define (midpoint-segment seg)
  (make-point (average-two (x-point (start-segment seg)) (x-point (end-segment seg)))
              (average-two (y-point (start-segment seg)) (y-point (end-segment seg)))))

(print-point 
 (midpoint-segment (make-segment 
                    (make-point 2 3) 
                    (make-point 8 8))))
