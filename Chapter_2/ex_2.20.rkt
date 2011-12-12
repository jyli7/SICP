#lang planet neil/sicp

(define (same-parity . l)
  (define (even-parity l)
    (if (null? (cdr l))
        (if (even? (car l))
            (car l)
            nil)
        (if (even? (car l))
            (cons (car l) (even-parity (cdr l)))
            (even-parity (cdr l)))))
  (define (odd-parity l)
    (if (null? (cdr l))
        (if (odd? (car l))
            (car l)
            nil)
        (if (odd? (car l))
            (cons (car l) (odd-parity (cdr l)))
            (odd-parity (cdr l)))))
  (if (even? (car l))
      (even-parity l)
      (odd-parity l)))

(same-parity 1 2 3 4 5 6 7)
 
(same-parity 2 3 4 5 6 7)
               