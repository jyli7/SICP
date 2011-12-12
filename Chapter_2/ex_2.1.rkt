#lang planet neil/sicp

;original make-rat
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

;improved make-rat
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cond ((and (< n 0) (< d 0)) (cons (/ (* -1 n) g) (/ (* -1 d) g)))
          ((< d 0) (cons (/ (* -1 n) g) (/ (* -1 d) g)))
          (else (cons (/ n g) (/ d g))))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat -1 3))