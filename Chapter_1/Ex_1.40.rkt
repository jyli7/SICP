#lang planet neil/sicp
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx 0.00001)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;cubic definition
(define (cubic a b c)
  (lambda (x) 
  (+ (* x x x)
     (* (* x x) a)
     (* x b)
     c)))

(define (cube-zeroes x)
  (newtons-method (cubic 0 0 0) 1))

(cube-zeroes 10)