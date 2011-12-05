#lang planet neil/sicp

;Recursive definition:
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;3 + 4 + 5 + 6

;my iterative definition:
;;in this definition, result comes after a. 
(define (sum-iter term a next b)
  (define (iter a result)
    (if (> (next a) b)
        result
        (iter (next a) (+ result (term (next a))))))
  (iter a (term a)))

(define (square x)
  (* x x))

(sum-iter square 0 inc 3)