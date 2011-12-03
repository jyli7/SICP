#lang planet neil/sicp

(define (square x)
  (* x x))

;recursive
(define (tan-cf x k)
  (define (tan i)
    (if (= i k)
        (if (= i 1)
            (/ x i)
            (/ (square x) (- (* 2 i) 1)))
        (if (= i 1)
            (/ x (- (- (* 2 i) 1) (tan (+ i 1))))
            (/ (square x) (- (- (* 2 i) 1) (tan (+ i 1)))))))
  (tan 1))

(tan-cf 3.0 100)
