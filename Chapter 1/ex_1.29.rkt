#lang planet neil/sicp
;;did not get solution on my own. had to refer to Lizard's. 

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (simpson f a b n)
(define h (/ (- b a) n))
(define (y k) (f (+ a (* k h))))
(define (inc x) (+ x 1))
(define (term k)
  (* (cond ((odd? k) 4)
           ((or (= k 1) (= k n)) 1)
           ((even? k) 2))
     (y k)))
  (/ (* h (sum term 0 inc n)) 3))

(simpson cube 0 1 100.0)
(simpson cube 0 1 1000.0)