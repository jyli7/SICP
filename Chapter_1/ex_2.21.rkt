#lang planet neil/sicp

(define (square x)
  (* x x))

;answer 1
(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

;answer 2
(define (square-list-map items)
  (map square items))

(square-list (list 1 3 5))
(square-list-map (list 1 3 5))