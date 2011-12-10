#lang planet neil/sicp

(define (last-pair l)
  (if (null? (cdr l))
      (list (car l))
      (last-pair (cdr l))))

(last-pair (list 23 72 149 34))