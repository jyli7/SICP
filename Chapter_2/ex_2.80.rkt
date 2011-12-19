#lang planet neil/sicp

(define (=zero? x) (apply-generic '=zero? x))

(put '=zero? '(scheme-number) 
     ('scheme-number (lambda (x) (= x 0))))

(put '=zero? '(rational) 
     ('rational (lambda (x) (= (numer x) 0))))

(put '=zero? '(rational) 
     ('complex (lambda (x) (= (magnitude x) 0))))


