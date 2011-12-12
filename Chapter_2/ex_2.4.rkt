#lang planet neil/sicp

;The goal here is to show that there are various ways to make a *procedural* representation of pairs. 

(define (cons x y)
  (lambda (m) (m x y)))

;Check that the following definition of (car z) works

(define (car z)
  (z (lambda (p q) p)))

;If z is the lambda returned by cons x y, then it takes 1 argument. 
;The one argument in this case is a procedure: (lambda (p q) p))
;This procedure, in turn, accepts two arguments and returns the first. 
;In this case, the two arguments are x and y. Therefore it returns x. 

;Define (cdr z)

(define (cdr z)
  (z (lambda (p q) q)))

(car (cons 7 8))

