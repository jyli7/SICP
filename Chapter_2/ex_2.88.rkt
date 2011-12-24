#lang planet neil/sicp

;Define negate function for the 3 kinds of numbers

(define (negate x) (apply-generic 'negate x))

(put 'negate 'scheme-number
     (lambda (n) (tag (-n))))

(put 'negate 'rational
     (lambda (rat) (make-rational (- (numer rat)) (denom rat))))

(put 'negate 'complex 
     (lambda (z) (make-from-real-imag (- (real-part z))
                                      (- (imag-part z)))))

(define (negate-terms terms)
  (if (empty-termlist? terms)
      (the-empty-termlist
       (let ((first (first-term terms)))
         (adjoin-term (make-term (order first) (negate (coeff first)))
                      (negate-terms (rest-terms terms)))))))

(put 'negate 'polynomial
     (lambda (poly) (make-polynomial (variable poly)
                                     (negate-terms (term-list poly)))))

(put 'sub '(polynomial polynomial)
     (lambda (x y) (tag (add-poly x) (negate y))))


         