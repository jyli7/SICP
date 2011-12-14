#lang planet neil/sicp

(define (reverse l)
  (if (null? (cdr l))
      (list (car l))
      (append (reverse (cdr l)) (list (car l)))))

(display (reverse (list 1 4 (list 8 9) 16 25)))