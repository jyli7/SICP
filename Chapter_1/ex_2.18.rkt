#lang planet neil/sicp

(define (reverse l)
  (if (null? (cdr l))
      (car l)
      (cons (reverse (cdr l)) (car l))))

(reverse (list 1 4 9 16 25))