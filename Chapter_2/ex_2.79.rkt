#lang planet neil/sicp

(define (equ x y) (apply-generic 'equ x y))

;in scheme-numbers...

(put 'equ '(scheme-number scheme-number)
     (lambda (x y) (tag (= x y))))

;in rat numbers...
(put 'equ '(rational rational)
     (lambda (x y) (tag (and (= (numer x) (numer y))
                             (= (denom x) (denom y))))))

;in complex numbers...
(put 'equ '(complex complex)
     (lambda (z1 z2) (tag (and (= (real-part z1) (real-part z2))
                               (= (imag-part z1) (imag-part z2))))))

