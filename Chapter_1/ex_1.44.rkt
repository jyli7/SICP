#lang planet neil/sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x)
  (* x x))

(define (repeated f times)
  (lambda (x)
    (if (= times 1)
        (f x)
        ((compose f (repeated f (- times 1))) x))))

((repeated square 2) 5)

(define dx 0.00001)

;smooth
(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

;n-fold smoothed function
(define (n-fold-smoothed f num-times)
  (repeated (smooth f) n-times))

;apply 
((nfs some-func num-times) x)