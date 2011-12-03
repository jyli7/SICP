#lang planet neil/sicp

;a.

;Recursive definition
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;factorial
(define (identity n)
  n)

(define (inc n)
  (+ n 1))

(define (factorial n)
  (product identity 1 inc n))

(factorial 5)

;approximations of pi. greater n, more exact the approximation.

(define (pi n)
  (define (term-n k)
    (cond ((= 1 k) 2)
          ((even? k) (+ 2 k))
          ((odd? k) (+ 2 (- k 1)))))
  (define (term-d k)
    (cond ((odd? k) (+ 2 k))
          ((even? k) (+ 2 (- k 1)))))
  (* 4.0 (/ (product term-n 1 inc n)
          (product term-d 1 inc n))))

(pi 100)

;b. Iterative definition.

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(product-iter identity 3 inc 5)