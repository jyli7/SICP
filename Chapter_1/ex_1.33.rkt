#lang planet neil/sicp

;Recursive definition
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (accumulate combiner null-value term (next a) next b))))

(define (product term a next b)
  (accumulate (lambda (x y) (* x y))  1 term a next b))

(product (lambda (x) x) 2 inc 4)

;b. Iterative definition.

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result 
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (product-iter term a next b)
  (accumulate-iter (lambda (x y) (* x y)) 1 term a next b))

(product-iter (lambda (x) x) 2 inc 4)