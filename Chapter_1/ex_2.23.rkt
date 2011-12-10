#lang planet neil/sicp

(define (square x)
  (* x x))

(define (for-each proc list)
  (define (iter proc answer)
    (proc (car answer))
    (if (null? (cdr answer))
        (newline)
        (iter proc (cdr answer))))
  (iter proc list))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))