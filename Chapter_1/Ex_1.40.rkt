#lang planet neil/sicp

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))


;cubic definition
(define (cubic a b c)
  (define (cube x)
    (* x x x))
  (define (square x)
    (* x x))
  (+ (cube x)
     (* (square x) a)
     (* x b)
     c))

(define (cube-zeroes x)
  (newtons-method (cubic a b c) 1))

